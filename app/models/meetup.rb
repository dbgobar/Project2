class Event
  # creates getter methods for city and categories of events.
  attr_reader :city, :name, :event_url

  # initialize method takes 2 arguments city and name
  def initialize(city, name)

    # create the url using the city and name arguments. Also utilizing ENV
    # variable provided by figaro. Key value should be in 'config/application.yml'
    url = "http://api.meetup.com/2/events?key#{ENV["meetup_api_key"]}&group_urlname=Girl-Develop-It-Austin&sign=true.json"

    # utilizing httparty gem to make get request to the url prescribed in the
    # line above and storing the response into the variable below.
    response = HTTParty.get(url)

    # instantiating temp_f and weather by parsing through the JSON response
    @event = response["event"]

    # storing arguments as instance varibles in the model.city=location, and name is the category
    @city = city
    @name = name
    @event_url = event_url
  end
end
