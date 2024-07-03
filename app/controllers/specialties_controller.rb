class SpecialtiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_specialty, only: %i[edit update destroy]

  def new
    @specialty = Specialty.new
  end

  def create
    @specialty = Specialty.new(specialty_params)
    @specialty.doctor_id = params[:doctor_id]

    # if @specialty.save
    #   redirect_to new_consultation_fee_path(params[:doctor_id], @specialty), notice: 'Especialidade criada com sucesso.'
    # else
    #   render :new
    # end

    respond_to do |format|
      if params[:confirm].present? && @specialty.save!
        @consultation_fee = ConsultationFee.new
        @consultation_fee.specialty_id = @specialty.id
        @consultation_fee.save!
        format.html { redirect_to user_profile_path, notice: 'Especialidade atualizada com sucesso.' }
      elsif params[:confirm_and_create_new_fee].present? && @specialty.save!
        @consultation_fee = ConsultationFee.new
        @consultation_fee.specialty_id = @specialty.id
        @consultation_fee.save!
        format.html { redirect_to edit_consultation_fee_path(@specialty.doctor_id, @specialty.id, @consultation_fee.id), notice: 'Especialidade criada com sucesso.' }
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
    params.require(:specialty).permit(:title)
  end
end
