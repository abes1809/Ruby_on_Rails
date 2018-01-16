Rails.application.routes.draw do
  get "/hello_url" => 'pages#hello_method'
  get '/goodbye_url' => 'pages#goodbye_method'
end
