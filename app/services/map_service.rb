class MapService
  def get_coordinates(zipcode)
    response = conn.get('/geocoding/v1/address', {key: ENV['MAPQUEST_CONSUMER_KEY'], postalCode: zipcode})
    parsed = JSON.parse(response.body)
    parser(parsed)
  end

  private
  def parser(map)
    map = Map.new(map)
    JSON.parse(map.to_json)
  end

  def conn
    Faraday.new(url: 'http://www.mapquestapi.com')
  end
end
