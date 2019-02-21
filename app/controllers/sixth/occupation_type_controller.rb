class Sixth::OccupationTypeController < ApplicationController
  skip_before_action :authenticate_user!, raise: false
  before_action :set_applicant

  def question

  end

  def answer
    # @applicant.update(applicant_params)
     if params[:applicant][:occupation_type] == "Abhängige Beschäftigung (regular employment)"
      @applicant.occupation_type = 3
      @applicant.save
      redirect_to question_seventh_university_degree_path(@applicant)
    else
      redirect_to choose_other_path(@applicant)
    end

  end

  private

  def set_applicant
    @applicant = Applicant.find(params[:id])
  end

  def applicant_params
    params.require(:applicant).permit(:occupation_type)
  end
end
