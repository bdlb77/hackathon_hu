class Seventh::ScarceOccupationController < ApplicationController
  skip_before_action :authenticate_user!, raise: false
  before_action :set_applicant

  def question
     @number = 7
     @question = "Scarce occupation?"
      render layout: 'question'
  end

  def answer
    @applicant.update(applicant_params)
    if @applicant.scarce_occupation
      redirect_to question_seventh_earning_path(@applicant)
    else
      redirect_to question_eighth_final_info_path(@applicant)
    end
  end


  private

  def set_applicant
    @applicant = Applicant.find(params[:id])
  end

  def applicant_params
    params.require(:applicant).permit(:scarce_occupation)
  end
end
