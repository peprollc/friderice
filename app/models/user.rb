class User < ApplicationRecord
  has_many :post_users
  has_many :shops, through: :post_users, autosave: true
end
