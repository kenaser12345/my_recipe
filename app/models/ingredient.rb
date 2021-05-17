class Ingredient < ApplicationRecord
  has_many :recipes, through: :ingredients_lists
  has_many :ingredients_lists

  validates :name, presence: true
end
