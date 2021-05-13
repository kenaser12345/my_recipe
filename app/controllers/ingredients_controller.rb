class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    byebug
    if @ingredient.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @ingredient = Ingredient.all.find(params[:id])
  end

  def update
    ingredient = Ingredient.all.find(params[:id])

    if ingredient.update(ingredient_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    ingredient = Ingredient.all.find(param[:id])
    ingredient.destroy
    redirect_to root_path
  end



  private

  def ingredient_params
    params.require(:ingredient).permit(
                                        :name
                                      )
  end
end
