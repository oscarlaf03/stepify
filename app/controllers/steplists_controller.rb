class SteplistsController < ApplicationController
  before_action :set_user, only: [:create, :update]
  before_action :set_steplist, only: [:edit, :show, :update, :destroy ]
  def new
    @steplist = Steplist.new
  end

  def create
    @steplist = Steplist.new(check_params)
    @steplist.user = @user
    if @steplist.save
      redirect_to steplist_path(@steplist)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @steplist.update(check_params)
      redirect_to steplist_path(@steplist)
    else
      render :edit
    end
  end

  def index
    @steplists = Steplist.all
  end

  def show
  end

  def destroy
    if @steplist.destroy
      redirect_to root_path
    end
  end

  private

  def set_steplist
    @steplist = Steplist.find(params[:id])
  end

  def check_params
    params.require(:steplist).permit(:title, :description)
  end

  def set_user
    @user = current_user
  end

end
