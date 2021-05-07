class Recipe < ApplicationRecord
  has_many :steps
  belongs_to :user
end
