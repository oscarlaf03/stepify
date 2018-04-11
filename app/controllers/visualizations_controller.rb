class VisualizationsController < ApplicationController
  before_action :set_user, only: [:dashboard]


  def dashboard
    @all_views = policy_scope(Visualization).order(created_at: :desc)
    @my_views = policy_scope(Visualization).where(user: @user)
  end

  private

  def set_user
    @user = current_user
  end
end
