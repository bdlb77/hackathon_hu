class Nineth::ResultsController < ApplicationController
  skip_before_action :authenticate_user!, raise: false

  def results
    render layout: "successful"
  end
end
