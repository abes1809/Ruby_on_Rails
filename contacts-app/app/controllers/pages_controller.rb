class PagesController < ApplicationController

  def first_contact_method
    contact = Contact.last
    render json: {
                    first_name: contact.first_name,
                    last_name: contact.last_name,
                    email: contact.email, 
                    phone_number: contact.phone_number
                    }
  end

  def all_contacts_method 
    contacts_data = Contact.all
    contacts_collection = []

    contacts_data.each do |contact|
      contacts_collection  <<  {
                              first_name: contact.first_name,
                              last_name: contact.last_name,
                              email: contact.email, 
                              phone_number: contact.phone_number
                              }
    end 
    
    render json: contacts_collection
  end 

end
