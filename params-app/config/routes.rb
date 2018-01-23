Rails.application.routes.draw do
 get '/query_params_url' => 'pages#query_params_method'
 get '/segment_params_url/:this_is_a_variable' => 'pages#segment_params_method'
end
