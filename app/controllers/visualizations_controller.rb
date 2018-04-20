class VisualizationsController < ApplicationController
  before_action :set_user, only: [:dashboard]


  def dashboard
    @my_views = policy_scope(Visualization).where(user: @user)
    @my_views_sum = my_views_sum(@my_views)
    @my_steplists = policy_scope(Steplist).where(user: @user)
    @my_seen_steplists = my_seen_steplists(@my_steplists)
    @views_for_my_steplists = total_views_of_my_steplists(@my_steplists)
  end





  private

  def set_user
    @user = current_user
  end

  def my_seen_steplists(my_steplists)
    counter = 0
    my_steplists.each do |steplist|
      counter_step_views = 0
      size = steplist.steps.length
      steplist.steps.each do |step|
        counter_step_views += 1 if !Visualization.find_by(step: step).nil?
      end
      counter += 1 if size == counter_step_views
    end
    return counter
  end

  def total_views_of_my_steplists(my_steplists)
    counter_views = 0
    my_steplists.each do |steplist|
      views_of_steps = []
      steplist.steps.each do |step|
        Visualization.where(step: step).each do |view|
          views_of_steps << view.views
        end
      end
      counter_views += views_of_steps.min unless views_of_steps.include?(0) || views_of_steps.length.zero?
    end
    return counter_views
  end

  def my_views_sum(my_views)
    counter = 0
    my_views.each do |view|
      counter += view.views
    end
    return counter
  end

end
