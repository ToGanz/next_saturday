class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @event  = current_user.events.build
    end
    @events = Event.where("date > ?", DateTime.yesterday ).paginate(page: params[:page])
  end

  def help
  end
  
  def contact
  end
end
