class Map
  def initialize(coordinates)
    @latitude = coordinates["results"][0]["locations"][0]["latLng"]["lat"].to_s
    @longitude = coordinates["results"][0]["locations"][0]["latLng"]["lng"].to_s
  end
end
