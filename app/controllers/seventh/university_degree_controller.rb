class Seventh::UniversityDegreeController  < ApplicationController
  skip_before_action :authenticate_user!, raise: false
  before_action :set_applicant

  def question
  end

  def answer
    @applicant.update(applicant_params)
    if @applicant.university_degree
      redirect_to choose_other_path(@applicant)
    else
      redirect_to question_eighth_final_info_path(@applicant)
    end
  end


  private

  def set_applicant
    @applicant = Applicant.find(params[:id])
  end

  def applicant_params
    params.require(:applicant).permit(:university_degree)
  end
end
