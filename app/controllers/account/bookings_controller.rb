class Account::BookingsController < ApplicationController

  before_action :set_services, except: [:index]

  def index
    @services = Service.search(params[:search])

    @hash = Gmaps4rails.build_markers(@services) do |service, marker|
      marker.lat service.user.profile.latitude
      marker.lng service.user.profile.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end

  end

  def new
    @booking = Booking.new
  end

  def create
    b = Booking.new
    b.user = current_user
    b.service_id = params[:service_id]
    b.validated_booking = true
    # s = Service.new(services_params)
    # s.user = current_user
    b.save
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
    @services = Service.all
  end

  def set_bookings
    @bookings = current_user.services
  end



  def bookings_params
    params.require(:booking).permit(:startdate, :endate, :validated_booking)
  end

end
