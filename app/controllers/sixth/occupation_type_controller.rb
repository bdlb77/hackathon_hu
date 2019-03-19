class Sixth::OccupationTypeController < ApplicationController
  skip_before_action :authenticate_user!, raise: false
  before_action :set_applicant

  def question
  end

  def answer
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

    # if !!
    @applicant.save
    if @applicant.occupation_type == "Freiwilligendienst"
      redirect_to successful_nineth_result_path(@applicant)
    elsif @applicant.occupation_type == "Berufsausbildung" && (@applicant.application_date < (Date.current - 3.months))
      redirect_to needs_authorization_nineth_result_path(@applicant)
    elsif @applicant.occupation_type == "Praktikum"
      redirect_to question_length_sixth_internship_path(@applicant)
    elsif @applicant.occupation_type == "Abhängige_Beschäftigung"
      redirect_to question_seventh_university_degree_path(@applicant)
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
