require 'test_helper'

class AnswersusersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get answersusers_create_url
    assert_response :success
  end

end
