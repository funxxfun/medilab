class PrescriptionsController < ApplicationController
  before_action :set_prescription, only: [:show, :edit, :update, :destroy]

  def index
    @prescriptions = Prescription.all
  end

  def show
  end

  def new
    @prescription = Prescription.new
    @patients = Patient.all
    @medications = Medication.all
  end

  def create
    @prescription = Prescription.new(prescription_params)
    @prescription.formatted_issue_date = Date.today

    if @prescription.save
      create_prescription_items(@prescription)
      check_interaction(@prescription)
      redirect_to @prescription, notice: "処方箋が作成されました"
    else
      @patients = Patient.all
      @medications = Medication.all
      reender :new
    end
  end

  private
    def set_prescription
      @prescription = Prescription.find(params[:id])
    end

    def prescription_params
      params.require(:prescription).permit(:patient_id, medication_ids: [])
    end

    def create_prescription_items(prescription)
      if params[:medication_ids].present?
        params[:medication_ids].each do |medication_id|
          prescription.prescription_items.create(
            medication_id: medication_id,
            dosage: params[:dosages][medication_id] || "1日３回　１錠ずつ",
            instruction: params[:instructions][medication_id] || "食後に服用してください"
            )
        end
      end
    end

    def check_interaction(prescription)
      medications = prescription.medications

      Interactions = []
      medications.to_a.combination(2) do |med1, med2|
        interaction = Interaction.find_by(
          medication1_id: med1.id,
          medication2_id: med2.id
        ) || Interaction.find_by(
          medication1_id: med2.id,
          medication2_id: med1.id
        )

        interactions << interaction if interaction
      end

      if interactions.any?
        severity = interactions.map(&:severity).max_by { |s| Interaction.severities[s] }
        flash[:alert] = "注意: #{severity} レベルの薬剤相互作用が検出されました。詳細を確認してください。"
      end
    end
end
