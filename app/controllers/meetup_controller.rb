class MeetupController < ApplicationController
  def get_meetup
    if params[:city] && params[:name]
      @Event = Event.new(params[:city], params[:name])
    else
      @event = Event.new("90210", "networking")
    end
  end
end
