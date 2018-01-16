class PagesController < ApplicationController

  # def initialize 
  #   @fortune_number = rand(1..3)
  # end 
  
  def fortune_method

  #   if @fortune_number == 1 
  #     fortune = "You will win a purple hippo"
  #   elsif @fortune_number == 2 
  #     fortune = "You will become a boss at coding"
  #   elsif @fortune_number == 3 
  #     fortune = "You will live long and own many puppies"
  #   end 

  #   render json: {fortune: fortune}

    #class example 

    fortunes = [
                "you will live long and own many puppies",
                "you will have cake for lunch",
                "you will Actualize yourself...NOW!!!"
                ]

    fortune = fortunes[rand(fortunes.length)]
    render json: {fortune_teller_says: fortune}
  end 

  def lottery_method 
    lottery_numbers = []
    6.times { lottery_numbers << rand(1..60) }

    lottery = "your lottery numbers are #{lottery_numbers}"

    render json: {lottery: lottery}

  end 

  def number_of_visits
    count = count + 1 

    render json: {page_visit: count}
  end 

  def bottles_method

    number_of_bottles = 99 
    lyrics = [ ]

    100.times do 
      if number_of_bottles > 1
        lyrics << "#{number_of_bottles} bottles of beer on the wall, #{number_of_bottles} bottles of beer, take one down pass it around, #{number_of_bottles} bottle of beer on the wall.  " 
      elsif number_of_bottles == 1 
         lyrics << "#{number_of_bottles} bottle of beer on the wall, #{number_of_bottles} bottle of beer, take one down pass it around, #{number_of_bottles} bottle of beer on the wall. " 
       elsif number_of_bottles == 0 
        lyrics << "no bottles of beer on the no bottle of beer, go store to store buy some more, 99 bottles of beer on the wall. " 
      end 
      number_of_bottles = number_of_bottles - 1 

    end 
      
      render json: {lyrics: lyrics.to_s, number_of_bottles: number_of_bottles}     

  end 
        
end

