class IngredientsController < ApplicationController
before_action :find_ingredient, only: [:destroy]


  def index
    @ingredients = Ingredient.all
  end

  def destroy
    @ingredient.destroy
    redirect_to request.referrer
  end

  def new
     @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(review_params)
    # byebug
    if @ingredient.save
      redirect_to ingredients_path
    else
      render :new
      #render :template => "cocktails/show"
    end
  end

 private

  def find_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def review_params
    params.require(:ingredient).permit(:name)
  end

end
