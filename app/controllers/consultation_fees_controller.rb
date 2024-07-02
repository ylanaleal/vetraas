class ConsultationFeesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_consultation_fee, only: %i[edit update destroy]

  def new
    @consultation_fee = ConsultationFee.new
  end

  def create
    @consultation_fee = ConsultationFee.new(consultation_fee_params)
    @consultation_fee.specialty_id = params[:specialty_id]

    respond_to do |format|
      if params[:save_and_create_specialty].present? && @consultation_fee.save
        format.html { redirect_to new_specialty_path(params[:doctor_id]), notice: 'Taxa de consulta criada com sucesso.' }
      elsif params[:save_and_create_fee].present? && @consultation_fee.save
        format.html { redirect_to new_consultation_fee_path(params[:doctor_id], params[:specialty_id]), notice: 'Taxa de consulta criada com sucesso.' }
      elsif params[:save_and_return].present? && @consultation_fee.save
        format.html { redirect_to user_profile_path, notice: 'Taxa de consulta criada com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    if @consultation_fee.update(consultation_fee_params)
      redirect_to user_profile_path, notice: 'Taxa de consulta atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @consultation_fee.destroy
    redirect_to user_profile_path, notice: 'Taxa de consulta excluída com sucesso.'
  end

  private

  def set_consultation_fee
    @consultation_fee = ConsultationFee.find(params[:id])
  end

  def consultation_fee_params
    params.require(:consultation_fee).permit(:title, :value)
  end
end
