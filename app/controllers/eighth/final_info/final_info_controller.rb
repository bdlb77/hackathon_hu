class Eighth::FinalInfoController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_applicant

  def question
  end

  private

  def set_applicant
    @applicant = Applicant.find(params[:id])
  end

  def applicant_params
    params.require(:applicant).permit(:university_degree)
  end

end
