class Account::ProfileController < ApplicationController

  before_action :set_services, only:[:index, :update, :show]
  before_action :set_profile


  def show
    if !current_user.profile
      redirect_to new_account_profile_path
    end
    @profile = current_user.profile
    if @profile
      @profile_coordinates = { lat: @profile.latitude, lng: @profile.longitude }
    end
  end

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.create_profile(profile_params)
    redirect_to account_profile_path
  end

  def update
    @profile.update(profile_params)
    redirect_to account_profile_path
  end

  private
  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:last_name, :first_name, :expert)
  end

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
