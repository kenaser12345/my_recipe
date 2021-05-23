class RecipesController < ApplicationController
  layout 'homepage'
  def index
    @recipes = current_user.recipes.all
  end

  def new
    @recipe = Recipe.new
    @recipe.steps.new("sequence" => "1")
    ingredient = @recipe.ingredients.new
    ingredient.ingredients_lists.new
  end

  def create
    list_params = pick_ingredients_lists_params
    fixed_params = delete_list_params(recipe_params)
  
    @recipe = current_user.recipes.build(fixed_params)

    if @recipe.save
      set_all_ingredient_amount(@recipe, list_params)
      redirect_to recipes_path
    else
      render :new, notice: "似乎有那裡不對勁"
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients_lists = @recipe.ingredients_lists
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

  #Ajax add ingredient
  def add_ingredient
    @recipe = Recipe.new
    ingredient = @recipe.ingredients.new
    ingredient.ingredients_lists.new
    render "add_ingredient", :layout => false  
  end

  #Ajax add step
  def add_step
    @recipe = Recipe.new
    step = @recipe.steps.new
    render "add_step", :layout => false
  end

  private
  def recipe_params
    params.require(:recipe).permit(
                                    :name,
                                    :description,
                                    :time,
                                    :quantity,
                                    :image,
                                    steps_attributes: [:image, :sequence, :description],
                                    ingredients_attributes: [:name, ingredients_lists_attributes: [:amount]]
                                    
                                  )
  end  

  def pick_ingredients_lists_params
    # 取得ingredient_list參數
    list_params_array = recipe_params[:ingredients_attributes].values.map{|a| a[:ingredients_lists_attributes].values[0][:amount]}
    return list_params_array
  end

  def delete_list_params(params)
    output = params
    output[:ingredients_attributes].values.map{|i| i.delete(:ingredients_lists_attributes)}
    output
  end

  def set_all_ingredient_amount(recipe, list_params_array)
    ids_array = recipe.ingredients.ids
    i = 0
    while i < ids_array.length
      list = recipe.ingredients_lists.find_by(ingredient_id: ids_array[i])
      list.amount = list_params_array[i]
      list.save
      i += 1
    end
  end
end
