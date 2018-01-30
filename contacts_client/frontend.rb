require 'unirest'

require_relative 'controllers/contact_controller'
require_relative 'models/contact'
require_relative 'views/contacts_view'

class Frontend 

  include ContactsController 
  include ContactsViews

  def run
    system 'clear'

    puts "Welcome to the contacts app!"
    puts "What would you like to do?"
    puts "      [1] Show all contacts."
    puts "        [1.1] Search all contacts."
    puts "      [2] Show one contact."
    puts "      [3] Create a new contact."
    puts "      [4] Update a contact."
    puts "      [5] Delete a contact."

    puts "------" * 25

    input_option = gets.chomp 

    if input_option == "1"
      contacts_index_action

    elsif input_option == "1.1"
      print "What would you like to search for? "
      search_term = gets.chomp

      response = Unirest.get("http://localhost:3000/contacts?search=#{search_term}")
      contacts = response.body 
      puts JSON.pretty_generate(contacts)

    elsif input_option == "2"

      contacts_show_action

    elsif input_option == "3"
      
      contacts_create_action

    elsif input_option == "4"
      
      contacts_update_action

    elsif input_option == "5"
     
     contacts_destroy_action 

    end 
  end 

end 

# Frontend.new.run 