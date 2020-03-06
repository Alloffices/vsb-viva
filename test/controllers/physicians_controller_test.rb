require 'test_helper'

class PhysiciansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get physicians_index_url
    assert_response :success
  end

end
