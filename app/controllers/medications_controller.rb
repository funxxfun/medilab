class MedicationsController < ApplicationController
before_action :set_medication, only: [:show, :edit, :update, :destroy]

  def index
    @medications = Medication.all
  end

  def show
  end

  def new
    @medication = Medication.new
  end

  def create
    @medication = Medication.new(medication_params)

    if @medication.save
      redirect_to @medication, notice: "薬剤情報が登録されました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @medication.update(medication_params)
      redirect_to @medication, notice: "薬剤情報が更新されました"
    else
      render :edit
    end
  end

  def destroy
    @medication.destroy
    redirect_to medications_path, notice: "薬剤情報が削除されました"
  end

  private
    def set_medication
      @medication = Medication.find(params[:id])
    end

    def medication_params
      params.require(:medication).permit(:name, :dosage_from, :strength, description)
    end
end
