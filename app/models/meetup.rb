require 'httparty'
require 'rest-client'
require 'json'

class Meetup
  # creates getter methods for city and categories of events.
  attr_reader :name
  include HTTParty
  base_uri 'https://www.meetup.com/'
  # initialize method takes 2 arguments city and name
  def initialize(name)
    # create the url using the city and name arguments. Also utilizing ENV
    # variable provided by figaro. Key value should be in 'config/application.yml'
    resp = RestClient.get("http://api.meetup.com/2/events?key#{ENV['meetup_api_key']}&group_urlname=Girl-Develop-It-Austin&sign=true.json")
    # utilizing httparty gem to make get request to the url prescribed in the
    # line above and storing the response into the variable below.
    response = HTTParty.get(url)
    # instantiating meetup by parsing through the JSON response
    @meetup = JSON.parse(resp, { symbolize_names: true })[:event]
    # storing arguments as instance varibles in the model.name is the category
    @name = name
  end
end
