class SteplistsController < ApplicationController
  before_action :set_user, only: [:create, :update, :dashboard]
  before_action :set_steplist, only: [:edit, :show, :update, :destroy ]
  before_action :set_info_tag, only: [:create, :update]

  def index
    @steplists = policy_scope(Steplist).order(created_at: :desc)
    @my_steplists = policy_scope(Steplist).where(user: current_user).order(created_at: :desc)
    @my_pins = Pin.where(user: current_user)


  end



  def new
    @steplist = Steplist.new
    authorize @steplist
  end

  def create
    @steplist = Steplist.new(steplist_params)
    @steplist.user = @user
    authorize @steplist
    if params[:steplist][:organization].present?
      @steplist.organization = Organization.find(params[:steplist][:organization])
    end
    if @steplist.save

      redirect_to steplist_path(@steplist)
    else
      render :new
    end
  end



  def edit
  end

  def update
    if @steplist.update(steplist_params)
      redirect_to steplist_path(@steplist)
    else
      render :edit
    end
  end



  def show
    @step = Step.new
    @photos = @step.photos.build
    @steps = @steplist.steps.order(:created_at)
    @sum_of_steplists_step_views = sum_of_views_of_steps(@steplist)

  end

  def destroy
    if @steplist.destroy
      redirect_to root_path
    end
  end

  private

  def set_steplist
    @steplist = Steplist.find(params[:id])
    authorize @steplist
  end

  def steplist_params
    params.require(:steplist).permit(:title, :description, :user_tags, :private)
  end

  def set_user
    @user = current_user
  end

  def set_step
    @step = Step.find(params[:id])
  end

  def set_info_tag
    @info_tag = params[:steplist][:info_tag]
  end

  def sum_of_views_of_steps(steplist)
    counter = 0
    steplist.steps.each do |step|
      step.visualizations.each do |view|
        counter += view.views
      end
    end
    return counter
  end

end
