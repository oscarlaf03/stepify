class SteplistsController < ApplicationController
  before_action :set_user, only: [:create, :update]
  before_action :set_steplist, only: [:edit, :show, :update, :destroy ]
  def new
    @steplist = Steplist.new
  end

  def create
    @steplist = current_user.steplists.build(steplist_params)
    if @steplist.save
      redirect_to steplist_path(@steplist)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @steplist.update(check_steplist_params)
      redirect_to steplist_path(@steplist)
    else
      render :edit
    end
  end

  def index
    @steplists = Steplist.all
  end

  def show
    @step = Step.new
    # current_user.visualized_steplists << @steplist
  end

  def destroy
    if @steplist.destroy
      redirect_to root_path
    end
  end

  private

  def set_steplist
    @steplist = current_user.steplists.find(params[:id])
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
