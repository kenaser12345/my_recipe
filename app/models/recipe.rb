class Recipe < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  has_many :steps
  belongs_to :user
end
