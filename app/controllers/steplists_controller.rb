class SteplistsController < ApplicationController
  before_action :set_user, only: [:create, :update]
  before_action :set_steplist, only: [:edit, :show, :update, :destroy ]
  def new
    @steplist = Steplist.new
    authorize @steplist
  end

  def create
    @steplist = Steplist.new(steplist_params)
    authorize @steplist
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

  def index
    @steplists = policy_scope(Steplist).order(created_at: :desc)
    @my_created_steplists = policy_scope(Steplist).where(user: current_user)

  end

  def show
    @step = Step.new
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
    params.require(:steplist).permit(:title, :description, :steplist_id, :id)
  end

  def set_user
    @user = current_user
  end

   def set_step
    @step = Step.find(params[:id])
  end

end
