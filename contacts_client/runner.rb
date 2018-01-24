require 'unirest'

system 'clear'

puts "Welcome to the contacts app!"
puts "What would you like to do?"
puts "      [1] Show all contacts."
puts "      [2] Show one contact."
puts "      [3] Create a new contact."
puts "      [4] Update a contact."
puts "      [5] Delete a contact."

puts "------" * 25

input_option = gets.chomp 

if input_option == "1"

  response = Unirest.get("http://localhost:3000/contacts")
  contacts = response.body 
  puts JSON.pretty_generate(contacts)

elsif input_option == "2"

  print "Enter the ID of the contact you would like to look up: "
  input_id = gets.chomp 

  response = Unirest.get("http://localhost:3000/contacts/#{input_id}")
  contact = response.body 
  puts JSON.pretty_generate(contact)

elsif input_option == "3"
  client_params = {}

  print "First Name: "
  client_params[:first_name] = gets.chomp 

  print "Middle Name: "
  client_params[:middle_name] = gets.chomp 

  print "Last Name: "
  client_params[:last_name] = gets.chomp 

  print "Bio: "
  client_params[:bio] = gets.chomp 

  print "Email: "
  client_params[:email] = gets.chomp 

  print "Phone Number: "
  client_params[:phone_number] = gets.chomp 

  response = Unirest.post(
                          "http://localhost:3000/contacts",
                          parameters: client_params
                          )

  if response.code == 200
    contact = response.body 
    puts JSON.pretty_generate(contact)
  else 
    errors = response.body["errors"]
    puts ""
    puts "Your contact did not save."
    puts "For the following reasons: "
    puts "---" * 10
    errors.each do |error|
      puts error 
    end 
  end 

elsif input_option == "4"
  print "What's the ID of the contact you would like to update? "
  input_id = gets.chomp 

  client_params = {}

  response = Unirest.get("http://localhost:3000/contacts/#{input_id}")
  contact = response.body 

  print "First Name (#{contact["first_name"]}):"
  client_params[:first_name] = gets.chomp 

  print "Middle Name (#{contact["middle_name"]}) :"
  client_params[:middle_name] = gets.chomp 

  print "Last Name (#{contact["last_name"]}) :"
  client_params[:last_name] = gets.chomp 

  print "Bio (#{contact["bio"]}) :"
  client_params[:bio] = gets.chomp 

  print "Email (#{contact["email"]}):"
  client_params[:email] = gets.chomp 

  print "Phone Number (#{contact["phone_number"]}):"
  client_params[:phone_number] = gets.chomp 

  client_params.delete_if {|key, value| value.empty?}

  response = Unirest.patch("http://localhost:3000/contacts/#{input_id}",
                            parameters: client_params
                            )

  if response.code == 200
    product = response.body 
    puts JSON.pretty_generate(product)
  else 
    errors = response.body["errors"]
    puts ""
    puts "Your contact did not update."
    puts "For the following reasons: "
    puts "---" * 10
    errors.each do |error|
      puts error
    end 
  end 

elsif input_option == "5"
  print "Enter the ID of the contact you want to delete: "
  input_option = gets.chomp

  response = Unirest.delete("http://localhost:3000/contacts/#{input_option}")
  data = response.body 
  puts data["message"]

end 














    