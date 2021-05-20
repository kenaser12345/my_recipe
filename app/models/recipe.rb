class Recipe < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  has_many :steps, dependent: :destroy
  has_many :ingredients_lists, dependent: :destroy
  has_many :ingredients, through: :ingredients_lists
  belongs_to :user

  accepts_nested_attributes_for :steps
  accepts_nested_attributes_for :ingredients
  accepts_nested_attributes_for :ingredients_lists

  validates :name, :description, presence: true
  validates :time, :quantity, presence:true, numericality: { only_integer: true, greater_than: 0 }
  
  def self.build
    recipe = self.new
    recipe.ingredients.build
    recipe
  end
end
