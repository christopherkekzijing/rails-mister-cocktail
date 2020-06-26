class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
    @doses = Dose.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(params_cocktail)
    # raise
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy

    redirect_to root_path
  end

  private

  def params_cocktail
    params.require(:cocktail).permit(:name, photos: [])
  end
end
