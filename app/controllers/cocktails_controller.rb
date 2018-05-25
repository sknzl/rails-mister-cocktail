class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show, :destroy]

  def index
    filter= "'%#{params[:search]}%'"
    @filter_form = params[:search]
    @cocktails = Cocktail.where("name ILIKE #{filter}")
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(review_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end


  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def review_params
    params.require(:cocktail).permit(:name, :photo)
  end

end
