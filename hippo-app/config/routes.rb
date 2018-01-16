Rails.application.routes.draw do
  get "fortune_url" => 'pages#fortune_method'
  get "lottery_url" => 'pages#lottery_method'
  get "number_of_visits_url" => 'pages#number_of_visits'
  get "99_bottles" => 'pages#bottles_method'
end
