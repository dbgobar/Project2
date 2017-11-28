class MeetupController < ApplicationController
  require 'Meetup'

  def get_meetups
    if params[:name]
      @meetup = Meetup.new(params[:name])
    else
      @meetup = Meetup.new("networking")
    end
  end

  def index
    @meetups = HTTParty.get('https://api.meetup.com/2/events?key=#{ENV['meetup_api_key']}&group_urlname=Girl-Develop-It-Austin&sign=true',
    :headers =>{'Content-Type' => 'application/json'} )
  end

  meetup = Meetup.new(name)
end
