require 'unirest'

# input
# user enters a word

# output
# top example, definition, pronunciation

# get the right url for wordnik
# make sure that works in this file
# have the user enter some input to search flexibly
# make all three unirest requests work
# show info to the user
p 'enter your word'
word = gets.chomp

# make definition work
# then make it work with dynamic user input
response = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{word}/definitions?limit=200&includeRelated=true&useCanonical=false&includeTags=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5
")
definition = response.body[0]['text']

response_example = Unirest.get("http://api.wordnik.com/v4/word.json/#{word}/topExample?useCanonical=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")
example = response_example.body['text']

response_pronunciation = Unirest.get("http://api.wordnik.com/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")
pronunciation = response_pronunciation.body[0]['raw']


p "The definition of #{word} is #{definition}"
p "The top example of #{word} is #{example}"
p "The pronunciation of #{word} is #{pronunciation}"
# puts JSON.pretty_generate(response_pronunciation.body[0])

