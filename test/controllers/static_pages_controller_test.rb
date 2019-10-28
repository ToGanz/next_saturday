require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  test "should get root" do
    get root_url
    assert_response :success
  end

  test "should get home" do
    get home_path
    assert_response :success
  end

  test "should get help" do
    get help_path
    assert_response :success
  end

end
