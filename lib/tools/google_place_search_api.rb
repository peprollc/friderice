require 'net/https'
module GooglePlaceSearchApi
  GOOGLE_PLACE_URL = "https://maps.googleapis.com/maps/api/place/textsearch/json?query="

  class << self
    def get(keyword)
      return "{}" if keyword.blank?
      Net::HTTP.get(create_uri(keyword))
    end

    def create_uri(keyword)
      URI.parse(URI.encode("#{GOOGLE_PLACE_URL}#{keyword.gsub(" ", "+").to_s}&key=#{Settings.google_api.place.access_token}"))
    end
  end
end