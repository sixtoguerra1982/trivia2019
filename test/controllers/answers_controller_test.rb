require 'test_helper'

class AnswersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get answers_index_answers_url
    assert_response :success
  end

end
