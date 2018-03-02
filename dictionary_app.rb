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


# make definition work
# then make it work with dynamic user input
response = Unirest.get("http://api.wordnik.com:80/v4/word.json/hippopotamus/definitions?limit=200&includeRelated=true&useCanonical=false&includeTags=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5
")

# p response.body
# p response.body.class
definition = response.body[0]['text']
# puts JSON.pretty_generate(response.body[0])
