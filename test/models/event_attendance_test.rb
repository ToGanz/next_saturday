require 'test_helper'

class EventAttendanceTest < ActiveSupport::TestCase
  
  def setup
    @event_attendance = EventAttendance.new(user_id: users(:michael).id,
                                     event_id: events(:five).id)
  end

  test "should be valid" do
    assert @event_attendance.valid?
  end

  test "should require a follower_id" do
    @event_attendance.user_id = nil
    assert_not @event_attendance.valid?
  end

  test "should require a followed_id" do
    @event_attendance.event_id = nil
    assert_not @event_attendance.valid?
  end

end
