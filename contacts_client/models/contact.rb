class Contact 

  attr_accessor :id, :full_name, :full_name, :first_name, :middle_name, :last_name, :bio, :email, :phone_number

  def initialize(input_options)
    @id = input_options["id"]
    @first_name = input_options["first_name"]
    @last_name = input_options["last_name"]
    @middle_name = input_options["middle_name"]
    @full_name = input_options["full_name"]
    @bio = input_options["bio"]
    @email = input_options["email"]
    @phone_number = input_options["phone_number"]
  end 
end 
    


