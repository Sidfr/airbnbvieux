class ServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :show]
  before_action :set_service, only: [:show, :show]

  def home
  end

  def show

  end

  def index
    @services = Service.search(params[:search])
    redirect_to account_bookings_path
  end


  private

  def set_service
    @service = Service.find(params[:id])
  end

  def search_params
    params.require(:service).permit(:search)
  end

end
