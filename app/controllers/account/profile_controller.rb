class Account::ProfileController < ApplicationController


  def show
    if !current_user.profile
      redirect_to new_account_profile_path
    end
      @profile = current_user.profile
  end

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.create_profile(profile_params)
    redirect_to account_profile_path
  end

  private
  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:last_name, :first_name, :expert)
  end
end
