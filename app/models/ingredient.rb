class Ingredient < ApplicationRecord
   validates :name, uniqueness: true
   validates :name, presence: true
   has_many :doses
   before_destroy :check_for_cocktail


  private

  def check_for_cocktail
    unless self.doses.count > 0
      raise CustomException.new("Cannot delete while used by cocktail.")
    end
  end

end
