require 'test_helper'

class AsylumControllerTest < ActionDispatch::IntegrationTest
  test "should get question" do
    get asylum_question_url
    assert_response :success
  end

  test "should get answer" do
    get asylum_answer_url
    assert_response :success
  end

end
