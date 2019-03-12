class DashboardController < ApplicationController
  def show
    @applicants = current_user.applicants.limit(3)
    @total_applicants = current_user.applicants
    @user = current_user
  end

  def update
    current_user.update(user_params)
    redirect_to dashboard_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :address, :zip_code)
  end
end
