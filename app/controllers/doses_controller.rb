class DosesController < ApplicationController
  before_action :find_cocktail, only: [ :show]




  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def review_params
    params.require(:cocktail).permit(:name)
  end
end

end
