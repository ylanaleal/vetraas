class SpecialtiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_specialty, only: %i[edit update destroy]

  def new
    @specialty = Specialty.new
  end

  def create
    @specialty = Specialty.new(specialty_params)
    @specialty.doctor_id = params[:doctor_id]

    respond_to do |format|
      if params[:confirm].present? && @specialty.save!
        format.html { redirect_to user_profile_path, notice: 'Especialidade criada com sucesso.' }
      elsif params[:confirm_and_create_new_specialty].present? && @specialty.save!
        format.html { redirect_to new_specialty_path(params[:doctor_id]), notice: 'Especialidade criada com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    if @specialty.update(specialty_params)
      redirect_to user_profile_path, notice: 'Especialidade atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @specialty.destroy
    redirect_to user_profile_path, notice: 'Especialidade excluída com sucesso.'
  end

  private

  def set_specialty
    @specialty = Specialty.find(params[:id])
  end

  def specialty_params
    params.require(:specialty).permit(:title, :value)
  end
end
