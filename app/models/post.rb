class Post < ApplicationRecord
  has_many :post_disaster_ships
  has_many :disasters, through: :post_disaster_ships
end
