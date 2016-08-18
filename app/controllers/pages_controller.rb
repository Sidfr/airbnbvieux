class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :show]
  layout 'home'

  def home
  end


  private

  def set_service
    @service = Service.find(params[:id])
  end


end
