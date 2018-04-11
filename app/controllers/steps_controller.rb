class StepsController < ApplicationController
  before_action :set_step, only: [:edit,:update, :destroy, :show]
  before_action :set_user
  before_action :set_steplist, only: [:create, :new]
  after_action :count_view, only: [:show]

  def index
  end

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
    respond_to do |format|
      if @step.update(step_params)
        format.html { redirect_to steplist_path(@step.steplist) }
        format.json {}
      end
    end
  end

  def destroy
    @step.destroy
  end

  def show
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

  def step_viewed?
    !Visualization.find_by(step: @step).nil?
  end

  def step_viewed_by_this_user?
    !Visualization.find_by(step: @step, user: current_user).nil?
  end

  def count_view
    case
    when step_viewed? == true && step_viewed_by_this_user? == true
      then view = Visualization.find_by(step: @step, user: current_user)
      view.views += 1
      view.save
    else
      view = Visualization.new(user: current_user, step: @step)
      view.views += 1
      view.save
    end
  end
end
