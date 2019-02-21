class Nineth::ResultsController < ApplicationController
  skip_before_action :authenticate_user!, raise: false

  def results
    @applicant = Applicant.find(params[:id])
    render layout: "successful"
  end

  def form_1
    @applicant = Applicant.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render  pdf: "your-filename"
      end
    end
  end

  def form_2
    @applicant = Applicant.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render  pdf: "your-filename"
      end
    end
  end

end
