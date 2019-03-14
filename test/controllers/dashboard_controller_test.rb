require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get dashboard_dashboard_url
    assert_response :success
  end

end
