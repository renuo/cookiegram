require 'test_helper'

class CookiegramControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cookiegram_index_url
    assert_response :success
  end

end
