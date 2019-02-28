class QuestionnaireController < ApplicationController
  def new
    @applicant = Applicant.new
  end
end
