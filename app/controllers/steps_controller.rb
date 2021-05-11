class StepsController < ApplicationController

  def index
    @recipe = current_user.recipes.find(params[:recipe_id])
    @steps = @recipe.steps
  end

  def new
    @step = Step.new
  end

  def create
    @step = current_user.recipes.find(params[:recipe_id]).steps.build(step_params)
    if @step.save
      redirect_to recipe_steps_path
    else
      render :new
    end
  end

  def destroy
  end

  def edit
    @step = current_user.steps.find(params[:id])
  end

  def update
  end

  private
  def step_params
    params.require(:step).permit(:image, :description, :sequence, :recipe_id, :user_id)
    
  end
end
