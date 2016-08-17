class Account::ServicesController < ApplicationController

  before_action :set_services, only:[:index, :update]

  def index

  end

  def new
    @service = Service.new
  end

  def create
    @service = current_user.services.create(services_params)
    # s = Service.new(services_params)
    # s.user = current_user
    # s.save
    redirect_to account_profile_path
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    @service.update(services_params)
    redirect_to account_profile_path
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    redirect_to account_profile_path
  end

  private

  def set_services
    @services = current_user.services
  end

  def set_service
    @service = @services
  end

  def services_params
    params.require(:service).permit(:description, :city)
  end

end
