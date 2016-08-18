class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :show]
  layout 'home'

  def home
    @services = Service.all

    @hash = Gmaps4rails.build_markers(@services) do |service, marker|
      marker.lat service.user.profile.latitude
      marker.lng service.user.profile.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end


  private

  def set_service
    @service = Service.find(params[:id])
  end


end
