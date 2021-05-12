class Recipe < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  has_many :steps, dependent: :destroy
  belongs_to :user
end
