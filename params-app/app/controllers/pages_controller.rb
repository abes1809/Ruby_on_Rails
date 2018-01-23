class PagesController < ApplicationController

  def query_params_method 
    input_message = params[:my_message]

    if input_message == "hello"
      output_message = "why hello there"
    else
      output_message = "shut up, go away"
    end 

    input_message_2 = params[:my_message_2]

    render json: {message: output_message, message_2: input_message_2}
  end 

  def segment_params_method 
    input_message = params[:this_is_a_variable]
    render json: {value: input_message}
  end 
end
