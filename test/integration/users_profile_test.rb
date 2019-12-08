require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:michael)
  end

  test "profile display" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_select 'h1', text: @user.name
    assert_match @user.attended_events.count.to_s, response.body
    @user.attended_events.each do |event|
      assert_match event.title, response.body
      #assert_match event.date, response.body #todo: warum so nicht testbar?
      assert_match event.content, response.body
    end
  end
end
