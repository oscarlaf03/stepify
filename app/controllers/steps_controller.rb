class StepsController < ApplicationController
  before_action :set_step, only: [:edit,:update, :destroy]
  before_action :set_user
  before_action :set_steplist, only: [:create, :edit, :new, :update, :destroy]

  def new
    @step = Step.new
  end

  def create
    @step = Step.new(step_params)
    @step.steplist = @steplist
    if @step.save
      respond_to do |format|
        format.html { redirect_to steplist_path(@steplist) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'shared/form_step', step: @step, steplist: @steplist }
        format.js
      end
    end
  end

  def edit
  end

  def update
    if @step.update(step_params)
      redirect_to steplist_path(@steplist)
      else render :new
    end
  end

  def destroy
    @step.destroy
  end


  private

  def set_step
    @step = Step.find(params[:id])
    authorize @step
  end

  def set_user
    @user = current_user
  end

  def set_steplist
    @steplist = Steplist.find(params[:steplist_id])
    authorize @steplist
  end

  def step_params
    params.require(:step).permit(:title,:description,:video,:photo,:document,:photo_cache, :steplist_id, :id)
  end
end
