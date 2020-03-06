require 'test_helper'

class OurLocationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get our_locations_index_url
    assert_response :success
  end

end
