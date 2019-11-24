require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @event = @user.events.build(title: 'Title1', content: 'content1', 
                                date: Time.now)
  end

  test "should be valid" do
    assert @event.valid?
  end

  test "user id should be present" do
    @event.user_id = nil
    assert_not @event.valid?
  end

  test "title should be present" do
    @event.title = "   "
    assert_not @event.valid?
  end

  test "date should be present" do
    @event.date = "   "
    assert_not @event.valid?
  end

  test "content should be at most 140 characters" do
    @event.content = "a" * 141
    assert_not @event.valid?
  end

  test "order should be oldest first" do
    assert_equal events(:oldest), Event.first
  end

end
