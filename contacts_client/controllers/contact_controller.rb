module ContactsController 

  def contacts_index_action

 
   response = Unirest.get("http://localhost:3000/contacts")
   contact_hashs = response.body
   contacts = []

   contact_hashs.each do |contact_hash|
     contacts << Contact.new(contact_hash)
   end

   contacts_index_view(contacts)

  end 

  def contacts_show_action

    print "Enter the ID of the contact you would like to look up: "
    input_id = gets.chomp 

    response = Unirest.get("http://localhost:3000/contacts/#{input_id}")
    contact_hash = response.body 
    contact = Contact.new(contact_hash)

    contacts_show_view(contact) 

  end 

  def contacts_create_action
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
  end 

  def contacts_update_action 
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
  end 

  def contacts_destroy_action
    print "Enter the ID of the contact you want to delete: "
    input_option = gets.chomp

    response = Unirest.delete("http://localhost:3000/contacts/#{input_option}")
    data = response.body 
    puts data["message"]
  end 

end 