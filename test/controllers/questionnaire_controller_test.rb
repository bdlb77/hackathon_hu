require 'test_helper'

class QuestionnaireControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get questionnaire_show_url
    assert_response :success
  end

end
