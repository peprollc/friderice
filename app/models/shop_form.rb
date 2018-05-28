class ShopForm
  include ActiveModel::Model

  attr_accessor :username
  attr_accessor :shop_name, :address
  attr_writer :user

  validates :username, :shop_name, :address, presence: true

  def save
    return false unless valid?
    ActiveRecord::Base.transaction do
      user.shops.build(name: shop_name, address: address)
      user.save
    end
  end

  def user
    @user ||= User.find_or_initialize_by(name: username)
  end
end
