class OrganizationUsersController < ApplicationController
  before_action :set_organization, only: [ :update, :new, :create, :destroy]

  def new
    @org_user = OrganizationUser.new
    authorize @org_user
  end

  def create
    if params[:organization_user][:user_email].split(",").size == 1
      mail = params[:organization_user][:user_email]
      @user = User.find_by(email: mail)
      @org_user = OrganizationUser.new(org_user_params)
      authorize @org_user
      @org_user.user = @user
      @org_user.organization = @organization
      if @org_user.save
        redirect_to (organization_path(@organization))
      else
        render :new
      end
    else
      params[:organization_user][:user_email].split(",").each do |user_email|
        @user = User.find_by(email: user_email)
        @org_user = OrganizationUser.new(org_user_params)
        authorize @org_user
        @org_user.organization = @organization
        @org_user.user = @user
        @org_user.save
      end
      if @org_user.save
          redirect_to (organization_path(@organization))
        else
        render :new
      end
    end
  end



  def edit
  end

  def update
    @org_user.update(org_user_params)
  end

  private

  def org_user_params
    params.require(:organization_user).permit( :organization_id, :admin, :user_email)
  end



  def set_organization
    @organization = policy_scope(Organization).find(params[:organization_id])
  end
end




