class Account::ReviewsController < ApplicationController

  before_action :set_reviews

  def index

  end

  private
  def set_reviews
    @reviews = current_user.received_reviews
  end

end
