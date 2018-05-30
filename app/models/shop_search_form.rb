class ShopSearchForm
  include ActiveModel::Model

  attr_accessor :keyword
  attr_writer :result

  def get
    result
    true
  rescue
    false
  end

  def build_shops
    @shops = []
    return @shops if result["results"].empty?
    result["results"].each do |data|
      @shops << Shop.new(
        name: data["name"],
        address: data["formatted_address"],
        latitude: data["geometry"]["location"]["lat"],
        longitude: data["geometry"]["location"]["lng"]
      )
    end
    @shops
  end

  private

    def result
      @result ||= JSON.parse(GooglePlaceSearchApi.get(keyword).force_encoding("utf-8"))
    end
end