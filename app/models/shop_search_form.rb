def ShopSearchForm
  include ActiveModel::Model

  attr_accessor :keyword
  attr_writer :result

  validates :keyword, presence: true

  def get
    parse
  end

  private

    def result
      @result ||=  GooglePlaceSearchApi.get(keyword)
    end

    def parse
      result
    end
end