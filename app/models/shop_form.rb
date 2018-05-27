class ShopForm
  include ActiveModel::Model

  attr_accessor :username
  attr_accessor :shop_name, :address

  validates :username, :shop_name, :address, presence: true

  def save
    return false unless valid?
    ActiveRecord::Base.transaction do
      user = User.find_or_initialize_by(name: username)
      user.shops.build(name: shop_name, address: address)
      user.save
    end
  end
end