class ReviewsController < ApplicationController


  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new(review_params)
    @dose = Dose.new
    @review.cocktail = @cocktail

    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @cocktail = Cocktail.find(@review.cocktail_id)
    @review.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
