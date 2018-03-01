class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all

    search_term = params[:search]
    if search_term
      @recipes = @recipes.where("title iLIKE ? OR ingredients iLIKE ?", 
                               "%#{search_term}%", 
                               "%#{search_term}%")
    end

    sort_attribute = params[:sort]
    if sort_attribute
      @recipes = @recipes.order(sort_attribute => :asc)
    end

    render 'index.json.jbuilder'
  end

  def create
    @recipe = Recipe.new(
                        title: params[:title],
                        user_id: current_user.id,
                        ingredients: params[:ingredients],
                        directions: params[:directions],
                        prep_time: params[:prep_time]
                        )
    @recipe.save
    render 'show.json.jbuilder'
  end

  def show
    @recipe = Recipe.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @recipe = Recipe.find(params[:id])

    @recipe.title = params[:title] || @recipe.title
    @recipe.chef = params[:chef] || @recipe.chef
    @recipe.ingredients = params[:ingredients] || @recipe.ingredients
    @recipe.directions = params[:directions] || @recipe.directions
    @recipe.prep_time = params[:prep_time] || @recipe.prep_time
    @recipe.save

    render 'show.json.jbuilder'
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    render json: { message: "Succefully destroyed Recipe ##{recipe.id}."}
  end
end









