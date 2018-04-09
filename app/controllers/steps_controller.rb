class StepsController < ApplicationController
  before_action :set_step
  before_action :set_user
  before_action :set_steplist, only: [:create, :edit, :new, :update, :destroy]

  def new
    @step = Step.new
  end

  def create
    @step = Step.new(check_step_params)
    @step.steplist = @steplist
    if @step.save
      redirect_to steplist_path(@steplist)
    else
      redirect_to steplist_path(@steplist)
    end
  end

  def edit
  end

  def update
    if @step.update(check_step_params)
      redirect_to steplist_path(@steplist)
      else render :new
    end
  end

  def destroy
    if @step.destroy
      redirect_to steplist_path(@steplist)
    end
  end

  private

  def set_step
    @step = Step.find.(params[:id])
  end

  def set_user
    @user = current_user
  end

  def set_steplist
    @steplist = Steplist.find(params[:steplist_id])
  end

  def check_step_params
    params.require(:step).permit(:title,:description,:video,:photo,:document,:photo_cache, :steplist_id, :id)
  end
end
