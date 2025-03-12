class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find_by(id: params[:id])
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(params[:patient])

    if @patient.save
      redirect_to @patient, notice: "患者が登録されました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @patient.update(params[:patient])
      redirect_to @patient, notice: "患者情報が更新されました"
    else
      render :edit
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_url, notice: "患者情報が削除されました"
  end


  private
    def set_patient
      @patient = Patient.find(params[:id])
    end

    def patient_params
      params.require(:patient).permit(:name, :age,:medical_history, :insurance_number)
    end
end
