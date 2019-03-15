class Sixth::OccupationTypeController < ApplicationController
  skip_before_action :authenticate_user!, raise: false
  before_action :set_applicant

  def question

  end

  def answer
    # @applicant.update(applicant_params)
    # raise
    case params[:applicant][:occupation_type]
    when "Abhängige Beschäftigung (regular employment)"
      @applicant.occupation_type = 3
    when "Berufsausbildung (traineeship)"
      @applicant.occupation_type = 2
    when "Freiwilligendienst (voluntary service)"
      @applicant.occupation_type = 1
    when "Praktikum (internship)"
      @applicant.occupation_type = 0
    end

    @applicant.save

    case @applicant.occupation_type
    when "Freiwilligendienst"
      redirect_to successful_nineth_result_path(@applicant)
    when "Berufsausbildung" && @applicant.application_date > (Date.current - 3.months)
      redirect_to needs_authorization
    when "Abhängige_Beschäftigung"

      redirect_to question_seventh_university_degree_path(@applicant)
    end
      # raise
  end

  def needs_authorization
  end

  private

  def set_applicant
    @applicant = Applicant.find(params[:id])
  end

  def applicant_params
    params.require(:applicant).permit(:occupation_type)
  end
end
