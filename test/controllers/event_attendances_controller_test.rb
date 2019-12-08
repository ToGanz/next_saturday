require 'test_helper'

class EventAttendancesControllerTest < ActionDispatch::IntegrationTest
  
  test "create should require logged-in user" do
    assert_no_difference 'EventAttendance.count' do
      post event_attendances_path
    end
    assert_redirected_to login_url
  end

  test "destroy should require logged-in user" do
    assert_no_difference 'EventAttendance.count' do
      delete event_attendance_path(event_attendances(:one))
    end
    assert_redirected_to login_url
  end

end
