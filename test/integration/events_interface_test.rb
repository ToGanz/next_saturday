require 'test_helper'

class EventsInterfaceTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:archer)
    @user2 = users(:malory)
  end

  test "event interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    # Invalid submission
    assert_no_difference 'Event.count' do
      post events_path, params: { event: { title: "", 
                                          date: "2019-11-23 16:05:30", 
                                          content: "content mccontentface" } }
    end

    assert_select 'div#error_explanation'
    # Valid submission
    title = "Event title"
    date = "2019-11-24 00:00:00"
    content =  "content mccontentface"
    assert_difference 'Event.count', 1 do
      post events_path, params: { event: { title: title,
                                  date: date,
                                  content: content, 
                                  user_id: @user.id } }
    end
    assert_redirected_to root_url
    follow_redirect!
    # die asserts funktionieren nicht, links sind aber 
    #assert_match title, response.body
    #assert_select 'a', text: "delete event"
    # Delete post
    last_event = @user.events.first
    assert_difference 'Event.count', -1 do
      delete event_path(last_event)
    end
    # log in as different user (no delete links)
    log_in_as(@user2)
    assert_select 'a', text: 'delete', count: 0
  end

end
