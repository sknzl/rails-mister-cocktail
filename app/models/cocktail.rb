class Cocktail < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, presence: true
  has_many :doses, :dependent => :delete_all
  has_many :ingredients, through: :doses

  mount_uploader :photo, PhotoUploader

end
