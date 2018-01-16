require "unirest"

response = unirest.get("htttp://localhost:3000/welcome_url")
welcome_data = response.body

puts JSON.pretty_generate(hello_data)