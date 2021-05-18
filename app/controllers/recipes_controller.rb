class RecipesController < ApplicationController
  before_action :authenticate_user!
  layout 'homepage'
  def index
    @recipes = current_user.recipes.all
  end

  def new
    @recipe = Recipe.new
    @recipe.steps.new("sequence" => "1")
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      redirect_to recipes_path
    else
      render :new
    end
  end

  def show
    @recipe = current_user.recipes.find(params[:id])
  end

  def destroy
    @recipe = current_user.recipes.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end
  
  def edit
    @recipe = current_user.recipes.find(params[:id])
  end

  def update
    @recipe = current_user.recipes.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipes_path
    else
      render :edit    
    end
  end
  private
  def recipe_params
    params.require(:recipe).permit(
                                    :name,
                                    :description,
                                    :time,
                                    :quantity,
                                    :image,
                                    steps_attributes: [:id, :image, :sequence, :description],
                                    ingredient_items: [],
                                  )
  end  
end
