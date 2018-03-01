class ArticlesController < ApplicationController
  def index
    search_term = params[:search]
    @articles = Unirest.get("https://newsapi.org/v2/everything?q=#{search_term}&apiKey=c0e17f96080643d5957dc95121007d1a").body
    render json: @articles 
  end 
end
