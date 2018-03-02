require 'unirest'

# flexible search
# user input for the city, state

# grab data from api
# temperature
# condition
# city

# flexible search
# user input for the city, state

p 'enter your city'
city = gets.chomp
p 'enter your state'
state = gets.chomp


response = Unirest.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22#{city}%2C%20#{state}%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")


response_city = response.body['query']['results']['channel']['location']['city']
response_temp = response.body['query']['results']['channel']['item']['condition']['temp']
response_text = response.body['query']['results']['channel']['item']['condition']['text']

# output
p "The current weather in #{response_city} is #{response_temp} degrees and it's #{response_text.downcase} outside"


