def ShopSearchForm
  include ActiveModel::Model

  attr_accessor :keyword
  attr_writer :result

  validates :keyword, presence: true

  def get
  end
end