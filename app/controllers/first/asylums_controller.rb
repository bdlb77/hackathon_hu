class First::AsylumsController < ApplicationController
  skip_before_action :authenticate_user!, raise: false
  before_action :set_applicant, only: [:question, :answer]

  def question
    render layout: "question"
  end

  def answer
    @applicant.update(applicant_params)
    if current_user
      @applicant.user = current_user
    end
    if @applicant.save
      if @applicant.asylum
        redirect_to question_second_living_obligation_path(@applicant)
      else
        redirect_to apply_for_asylum_first_asylum_path(@applicant)
      end
    else
      render :question
    end
  end

  def apply_for_asylum
    render layout: "fail_layout"
  end

  private

  def set_applicant
    @applicant = Applicant.find(params[:id])
  end

  def applicant_params
    params.require(:applicant).permit(:asylum)
  end
end
