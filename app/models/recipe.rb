class Recipe < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  has_many :steps, dependent: :destroy
  has_many :ingredients_lists, dependent: :destroy
  has_many :ingredients, through: :ingredients_lists
  belongs_to :user

  accepts_nested_attributes_for :steps

  validates :name, :description, presence: true
  validates :time, :quantity, presence:true, numericality: { only_integer: true, greater_than: 0 }
  def ingredient_tags
    Ingredient.all.map { |i| [i.name, i.name]}
  end

  def ingredient_items
    Ingredient.all.map(&:name)
  end

  def ingredient_items=(names)
    self.ingredients = names.map{|item|
      Ingredient.where(name: item.strip).first_or_create! unless item.blank?}
  end
end
