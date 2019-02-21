class Eighth::FinalInfoController < ApplicationController
  skip_before_action :authenticate_user!, raise: false
  before_action :set_applicant

  def question
  end

  private

  def set_applicant
    @applicant = Applicant.find(params[:id])
  end

end
