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
      unless params[:step][:photos].nil?
        params[:step][:photos].each do |photo|
          @photo = @step.photos.create!(image: photo)
        end
      end
      respond_to do |format|
        format.html { }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'shared/form_step', step: @step, steplist: @steplist }
        format.js { render json: @step.errors, status: :unprocessable_entity }
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
    steplist = @step.steplist
    @step.destroy
      respond_to do |format|
        format.html { redirect_to steplist_path(steplist) }
        format.json {}
      end
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
    params.require(:step).permit(:title,:description,:video, :document)
  end

  def step_viewed?
    !Visualization.find_by(step: @step).nil?
  end

  def step_viewed_by_this_user?
    !Visualization.find_by(step: @step, user: current_user).nil?
  end

  def count_view
    case
    when step_viewed_by_this_user? == true && user_signed_in? == true
      then view = Visualization.find_by(step: @step, user: current_user)
      view.views += 1
      view.save
    when user_signed_in? == false && Visualization.find_by(step: @step, user: nil).nil? == false
      then view = Visualization.find_by(step: @step, user: nil)
      view.views += 1
      view.save
    when user_signed_in? == false && !Visualization.find_by(step: @step, user: nil).nil? == false
      then view = Visualization.new(step: @step)
      view.views += 1
      view.save
    when step_viewed_by_this_user? == false && user_signed_in? == true
      then view = Visualization.new(user: current_user, step: @step)
      view.views += 1
      view.save
    else
      view = Visualization.new(step: @step)
      view.views += 1
      view.save
    end
  end

end
