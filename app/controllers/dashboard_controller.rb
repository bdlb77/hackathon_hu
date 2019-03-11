class DashboardController < ApplicationController
  def show
    @applicants = current_user.applicants.limit(3)
  end
end
