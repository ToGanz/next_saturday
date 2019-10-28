require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         "Next Saturday"
    assert_equal full_title("Help"), "Help | Next Saturday"
  end
end