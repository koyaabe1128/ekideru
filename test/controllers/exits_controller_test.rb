require 'test_helper'

class ExitsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get exits_index_url
    assert_response :success
  end

end
