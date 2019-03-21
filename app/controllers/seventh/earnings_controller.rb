class Seventh::EarningsController  < ApplicationController
  skip_before_action :authenticate_user!, raise: false
  before_action :set_applicant

  def question

  end

  def answer
    @applicant.update(applicant_params)
    if @applicant.earnings == "mehr als 49.600 EUR"
      redirect_to  question_seventh_scarce_occupation_path(@applicant)
    else
      redirect_to question_eighth_final_info_path(@applicant)
    end
  end


  private

  def set_applicant
    @applicant = Applicant.find(params[:id])
  end

  def applicant_params
    params.require(:applicant).permit(:earnings)
  end
end
