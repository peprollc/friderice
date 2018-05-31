module GoogleUrlHelper
  GOOGLE_MAP_URL = "https://www.google.com/maps/search/?api=1"

  def google_map_tag(address, options={})
    option_url = options.map { |key, value| "&#{key}=#{value}" }.join
    URI.escape GOOGLE_MAP_URL + "&query=" + address + option_url
  end
end