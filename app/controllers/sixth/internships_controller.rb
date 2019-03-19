class Sixth::InternshipsController < ApplicationController
  skip_before_action :authenticate_user!, raise: false
  before_action :set_applicant

  def question_length
  end

  def answer_length
    @applicant.update(applicant_params)
    # raise
    if @applicant.internship_length == "mehr als 3 Monate"
      redirect_to question_mandatory_sixth_internship_path(@applicant)
    elsif @applicant.internship_length == "weniger als 3 Monate"
      redirect_to successful_nineth_result_path(@applicant)
    end
  end

  def question_mandatory
  end

  def answer_mandatory
    @applicant.update(applicant_params)
    if @applicant.internship_mandatory
      redirect_to successful_nineth_result_path(@applicant)
    else
      redirect_to needs_authorization_nineth_result_path(@applicant)
    end
  end

  private

  def set_applicant
    @applicant = Applicant.find(params[:id])
  end

  def applicant_params
    params.require(:applicant).permit(:internship_length, :internship_mandatory)
  end
end
