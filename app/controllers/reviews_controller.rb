class ReviewsController < ApplicationController
  def new
  end

  def create
    @review = Review.new(params.require(:review).permit(:content, :rating, :cocktail_id))
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review.cocktail = @cocktail
    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end
end
