require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @event = events(:one)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Event.count' do
      post events_path, params: { event: { title: "Event test", 
                                          date: "2019-11-23 16:05:30", 
                                          content: "content mccontentface" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Event.count' do
      delete event_path(@event)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong event" do
    log_in_as(users(:archer))
    event = events(:one)
    assert_no_difference 'Event.count' do
      delete event_path(event)
    end
    assert_redirected_to root_url
  end

end
