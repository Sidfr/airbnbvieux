class ReviewsController < ApplicationController
  before_action :require_find_param, only: [:show]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.save
    redirect_to reviews_path
  end


  private

  def task_params
    params.require(:review).permit(:description, :stars, :sender, :recipient)
  end

  def require_find_param
    @review = Review.find(params[:id])
  end


end
