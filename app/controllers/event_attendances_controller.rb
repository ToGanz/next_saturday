class EventAttendancesController < ApplicationController
  before_action :logged_in_user

  def create
    event = Event.find(params[:event_id])
    current_user.attend(event)
    redirect_to event
  end

  def destroy
    event = EventAttendance.find(params[:id]).event
    current_user.unattend(event)
    redirect_to event
  end
end
