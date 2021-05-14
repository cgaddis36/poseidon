class StationsFacade
  def build_stations
    stations = NoaaService.new.get_stations
  end
end
