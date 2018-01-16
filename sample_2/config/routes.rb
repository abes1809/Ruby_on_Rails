Rails.application.routes.draw do
  get "/welcome_url" => 'pages#welcome_method'
end
