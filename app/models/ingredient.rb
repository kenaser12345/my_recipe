class Ingredient < ApplicationRecord
  has_many :recipe, through: :ingredients_list
end
