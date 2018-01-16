class PagesController < ApplicationController

  def welcome_method 
    sum = 1 + 1 
    time = Time.now.strftime("%b %e, %l:%M %p") 
    render json: {message: "Welcome", sum: sum, current_time: time}
  end 

end
