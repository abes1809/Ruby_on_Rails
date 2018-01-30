module ContactsViews

  def contacts_show_view(contact)

    puts 
    puts 
    puts "Contact ID: #{contact.id} - #{contact.full_name}"
    puts "---------------------------------------------"
    puts "#{contact.full_name}'s bio: #{contact.bio}"
    puts 
    puts "Phone Number: #{contact.email}"
    puts "Email Address: #{contact.phone_number}"
    puts
    puts "============================================="

  end 

  def contacts_index_view(contacts) 

    contacts.each do |contact|

      contacts_show_view(contact)
    end 

  end 
end 