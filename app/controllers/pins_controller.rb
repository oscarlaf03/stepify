class PinsController < ApplicationController
  before_action :set_user
  before_action :set_steplist, only: [:update_pin, :create, :destroy]

  def index
    @pins = policy_scope(Pin)
  end

  def update_pin
    @pin = current_user.pin(@steplist)

    if @pin
      authorize @pin
      @pin.destroy
    else
      @pin = Pin.new(steplist: @steplist)
      @pin.user = @user
      authorize @pin
      @pin.save
    end
  end

  private

  def set_user
    @user = current_user
  end

  def set_steplist
    @steplist = Steplist.find(params[:steplist_id])
  end
end
