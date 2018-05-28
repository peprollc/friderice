class Shop < ApplicationRecord
  has_many :images, class_name: 'ShopImage'
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'
  has_many :unfavorites
  has_many :unfavorite_users, through: :unfavorites, source: 'user'

  def vote_by?(user)
    favorite_users.include?(user) || unfavorite_users.include?(user)
  end

  def vote_favorite?(user)
    favorite_users.include?(user)
  end
end
