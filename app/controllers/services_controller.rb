class ServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :show]
  before_action :set_service, only: [:show, :show]

  def home
  end

  def show

  end

  def index
    @results = Service.search(params[:search])
  end


  private

  def set_service
    @service = Service.find(params[:id])
  end

  def search_params
    params.require(:service).permit(:search)
  end

end
