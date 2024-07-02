class DoctorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_doctor, only: %i[edit update destroy]

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to new_specialty_path(@doctor), notice: 'Médico criado com sucesso.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @doctor.update(doctor_params)
      redirect_to user_profile_path, notice: 'Médico atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @doctor.destroy
    redirect_to user_profile_path, notice: 'Médico excluído com sucesso.'
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :description)
  end
end
