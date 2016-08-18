class Account::ReviewsController < ApplicationController

  before_action :set_reviews
    before_action :set_profile

  def index

  end

  def new
    @review = Review.new
    @recipients = User.where.not(id: current_user.id) #mettre ici la personne qui réalise la prestation du booking plus tard
  end


  def create
    # @review = current_user.reviews.create(reviews_params)
    r = Review.new
    r.sender = current_user
    r.recipient_id = reviews_params["recipient_id"].to_i
    r.description = reviews_params["description"]
    r.stars = reviews_params["stars"]
    r.save
    redirect_to account_reviews_path
  end

  private
  def set_reviews
    @reviews = current_user.received_reviews
  end
  def reviews_params
    params.require(:review).permit(:description, :stars, :recipient_id)
  end

   def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:last_name, :first_name, :expert)
  end


end
