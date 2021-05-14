class NoaaService
  def get_stations
    response = conn.get("/mdapi/prod/webapi/stations.json")

    parsed_stations_data = JSON.parse(response.body)

    stations = create_stations(parsed_stations_data["stations"])
  end

  private

  def conn
    Faraday.new(url: 'https://api.tidesandcurrents.noaa.gov')
  end

  def create_stations(parsed_stations_data)
    parsed_stations_data.map do |station|
      new_station = Station.create(name: station["name"], lat: station["lat"], lon: station["lng"], station_id: station["id"], state: station["state"])
    end
  end
end
