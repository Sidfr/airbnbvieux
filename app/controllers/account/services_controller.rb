class Account::ServicesController < ApplicationController

  before_action :set_services, only:[:index, :update]


  def new
    @service = Service.new
  end

  def create
    @service = current_user.services.create!(services_params)
      if @service.save
        ServiceMailer.creation_confirmation(@service).deliver_now
        redirect_to account_profile_path
      else
        render :new
    # s = Service.new(services_params)
    # s.user = current_user
    # s.save
       end
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


  def index
    @results = Service.all.search(params[:search])
  end

  private

  def set_services
    @services = current_user.services
  end

  def set_service
    @service = @services
  end

  def services_params
    params.require(:service).permit(:description, :city, :price, :title)
  end

   def search_params
    params.require(:service).permit(:search)
  end

end
