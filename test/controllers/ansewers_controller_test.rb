require 'test_helper'

class AnsewersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ansewers_index_url
    assert_response :success
  end

end
