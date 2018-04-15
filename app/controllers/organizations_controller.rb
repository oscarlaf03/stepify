class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:edit, :update, :show, :destroy]
  def new
    @organization = Organization.new
    authorize @organization
  end

  def create
    @organization = Organization.new(organization_params)
    authorize @organization
    if @organization.save
      current_user.organization << @organization
      redirect_to organization_path(@organization)
    else
      render :new
    end
  end

  def edit
  end

  def update
   if  @organization.update(organization_params)
      redirect_to organization_path(@organization)
    end
  end

  def show
    @org_steplists = policy_scope(Steplist).where(organization: @organization)
  end

  def index
    @organizations = policy_scope(Organization).order(company_name: :desc)
  end

  private

  def organization_params
    params.require(:organization).permit(:company_name, :web_site, :logo, :logo_cache, :image_banner, :image_banner_cache)
  end

  def set_organization
    @organization = Organization.find(params[:id])
    authorize @organization
  end

end
