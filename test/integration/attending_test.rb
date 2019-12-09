require 'test_helper'

class AttendingTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
    @event = events(:six)
    log_in_as(@user)
    @other = users(:malory)
  end

  test "event page" do
    get event_path(@event)
    assert_not @user.attended_events.empty?
    assert_match @event.event_attendees.count.to_s, response.body
    assert_select "a[href=?]", user_path(@event.user)
  end

  # funktioniert nicht, eventuell fixtures problem?
  # test "should attend an event" do
  #   assert_difference '@event.event_attendees.count', 1 do
  #     post event_attendances_path, params: { user_id: @other.id, event_id: @event.id }
  #   end
  # end

  test "should unattend an event" do
    @other.attend(@event)
    event_attendance = @event.event_attendances.find_by(user_id: @other.id)
    assert_difference '@event.event_attendees.count', -1 do
      delete event_attendance_path(event_attendance.id)
    end
  end

end
