class Recipe < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  has_many :steps, dependent: :destroy
  has_many :ingredients_list, dependent: :destroy
  has_many :ingredients, through: :ingredients_list
  belongs_to :user
end
