class Second::LivingObligationsController < ApplicationController
  skip_before_action :authenticate_user!, raise: false
  def question
    @applicant = Applicant.find(params[:id])
  end

  def answer
    @applicant = Applicant.find(params[:id])
    if @applicant.update(applicant_params)
      if @applicant.living_obligation
        redirect_to unsuccessful_second_living_obligation_path
      else
        redirect_to question_third_refugee_crisis_path(@applicant)
      end
    else
      render :question, alert: "Try agian."
    end
  end

  def unsuccessful
    render layout: "fail_layout"
  end

  private

  def applicant_params
    params.require(:applicant).permit(:living_obligation)
  end
end
