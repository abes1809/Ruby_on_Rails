Rails.application.routes.draw do
  get "/first_contact_url" => 'pages#first_contact_method' 
  get "/all_contacts_url" => 'pages#all_contacts_method'
end
