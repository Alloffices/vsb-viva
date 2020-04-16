require 'test_helper'

class ToursControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tours_new_url
    assert_response :success
  end

  test "should get create" do
    get tours_create_url
    assert_response :success
  end

end
