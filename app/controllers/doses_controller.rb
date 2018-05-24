class DosesController < ApplicationController
  before_action :find_cocktail, only: [:new, :show, :create, :destory]

  def new
    @dose = Dose.new
    @dose.cocktail = @cocktail
  end

  def create
    @dose = Dose.new(review_params)
    @dose.cocktail = @cocktail
    # byebug
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
      #render :template => "cocktails/show"
    end
  end

  def destroy
    # byebug
    dose = Dose.find(params[:id])
    dose.destroy
    redirect_to request.referrer
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def review_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
