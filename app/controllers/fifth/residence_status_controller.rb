class Fifth::ResidenceStatusController  < ApplicationController
  skip_before_action :authenticate_user!, raise: false
  before_action :set_applicant

  def question
  end

  def answer
    if params[:applicant][:residence_status] == "Gestattung"
      @applicant.residence_status = 1
      @applicant.save
      redirect_to question_sixth_occupation_type_path(@applicant)
    else
      redirect_to choose_other_path(@applicant)
    end

  end

  def choose_other
    render layout: "fail_layout"
  end

  private

  def set_applicant
    @applicant = Applicant.find(params[:id])
  end

  def applicant_params
    params.require(:applicant).permit(:residence_statuss)
  end
end
