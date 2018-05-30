class ShopForm
  include ActiveModel::Model

  attr_accessor :username
  attr_accessor :name, :address
  attr_writer :user

  validates :username, :name, :address, presence: true

  def save
    return false unless valid?
    ActiveRecord::Base.transaction do
      user.shops.build(name: name, address: address)
      user.save
    end
  end

  def user
    @user ||= User.find_or_initialize_by(name: username)
  end
end
