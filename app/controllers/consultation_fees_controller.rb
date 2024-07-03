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
      if params[:save_and_create_specialty].present? && @consultation_fee.save!
        format.html { redirect_to new_specialty_path(params[:doctor_id]), notice: 'Taxa de consulta criada com sucesso.' }
      elsif params[:save_and_create_fee].present? && @consultation_fee.save!
        format.html { redirect_to new_consultation_fee_path(params[:doctor_id], params[:specialty_id]), notice: 'Taxa de consulta criada com sucesso.' }
      elsif params[:save_and_return].present? && @consultation_fee.save!
        format.html { redirect_to user_profile_path, notice: 'Taxa de consulta criada com sucesso.' }
      # elsif params[:back].present?
      #   @consultation_fee.save
      #   format.html { redirect_to user_profile_path, notice: 'Taxa de consulta criada com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    if request.referrer == user_profile_path && @consultation_fee.update(consultation_fee_params)
      redirect_to user_profile_path, notice: 'Taxa de consulta atualizada com sucesso.'
    elsif @consultation_fee.update(consultation_fee_params) && params[:save_and_create_fee].present?
      redirect_to new_consultation_fee_path(@consultation_fee.specialty.doctor_id, @consultation_fee.specialty_id), notice: 'Taxa de consulta atualizada com sucesso.'
    elsif @consultation_fee.update(consultation_fee_params) && params[:save_and_create_specialty].present?
      redirect_to new_specialty_path(@consultation_fee.specialty.doctor_id), notice: 'Taxa de consulta criada com sucesso.'
    elsif @consultation_fee.update(consultation_fee_params) && params[:save_and_return].present?
      redirect_to user_profile_path, notice: 'Taxa de consulta criada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    specialty = @consultation_fee.specialty
    if specialty.consultation_fees.count > 1
      @consultation_fee.destroy
      redirect_to user_profile_path, notice: 'Taxa de consulta excluída com sucesso.'
    else
      redirect_to user_profile_path, notice: 'Não é possível excluir a última taxa de consulta de uma especialidade'
    end
  end

  private

  def set_consultation_fee
    @consultation_fee = ConsultationFee.find(params[:id])
  end

  def consultation_fee_params
    params.require(:consultation_fee).permit(:title, :value)
  end
end
