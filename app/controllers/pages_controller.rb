class PagesController < ApplicationController
  skip_before_action :authenticate_user!, raise: false

  def home
  end

  def success
    @applicant = Applicant.find(params[:id])
    render layout: "successful"
  end

  def choose_other
    render layout: "fail_layout"
  end

  def wrong_zip_code
  end
end
