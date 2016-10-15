require 'test_helper'

class InstagramsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get instagrams_index_url
    assert_response :success
  end

  test "should get show" do
    get instagrams_show_url
    assert_response :success
  end

end
