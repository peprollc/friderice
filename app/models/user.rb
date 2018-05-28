class User < ApplicationRecord
  has_many :post_users
  has_many :shops, through: :post_users, autosave: true
  has_many :favorites, autosave: true
  has_many :favorite_shops, through: :favorites, class_name: 'Shop'
  has_many :unfavorites, autosave: true
  has_many :unfavorite_shops, through: :favorites, class_name: 'Shop'
end
