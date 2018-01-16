class PagesController < ApplicationController

  def hello_method 
    render jason: {message: "hello"}
  end 

  def goodbye_method
    reunder jason: {thingy: "goodbye"}
  end 

end
