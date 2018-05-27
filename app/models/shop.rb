class Shop < ApplicationRecord
  has_many :images, class_name: 'ShopImage'
end
