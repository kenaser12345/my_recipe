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
    step = current_user.recipes.find(params[:recipe_id]).steps.find(params[:id])
    step.destroy
    redirect_to recipe_steps_path
  end

  def edit
    @step = current_user.steps.find(params[:id])
  end

  def update
    step = current_user.recipes.find(params[:recipe_id]).steps.find(params[:id])
    if step.update(step_params)
      redirect_to recipe_steps_path
    else
      render :edit
    end
  end

  private
  def step_params
    params.require(:step).permit( :image, 
                                  :description, 
                                  :sequence,
                                  :recipe_id, 
                                  :user_id
                                )
    
  end
end
