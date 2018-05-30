require 'net/https'
module GooglePlaceSearchApi
  GOOGLE_PLACE_URL = "https://maps.googleapis.com/maps/api/place/textsearch/json?query="

  class << self
    def get(key)
      return "{}" if key.blank?
      Net::HTTP.get(create_uri(key))
    end

    def create_uri(key)
      URI.parse(URI.encode("#{GOOGLE_PLACE_URL}#{key.to_s}&key=#{Settings.google_api.place.access_token}"))
    end
  end
end