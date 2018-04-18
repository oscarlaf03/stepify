class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def test
  end

  def my_pins
    @my_pins = Pin.where(user: current_user)
  end

  def account
    @user = current_user
  end

  def search
    if params[:query].present?

      sql_query = " \
        steplists.title @@ :query \
        OR steplists.user_tags @@ :query \
        OR steplists.description @@ :query \
        OR steps.title @@ :query \
        OR steps.description @@ :query \
      "


      @steplists = policy_scope(Steplist).where(private: false).joins(:steps).where(sql_query, query: "%#{params[:query]}%").uniq
    else
      @steplists = policy_scope(Steplist).where(private: false).order(created_at: :desc)
    end
  end


  def my_lists
    @steplists = policy_scope(Steplist).where(user: current_user)
  end

  def my_orgs
    @my_orgs = current_user.organizations
  end

end
