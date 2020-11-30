files = ['app/assets/stations/florida.txt', 'app/assets/stations/alabama.txt',
         'app/assets/stations/georgia.txt', 'app/assets/stations/alaska.txt',
         'app/assets/stations/california.txt', 'app/assets/stations/connecticut.txt',
          'app/assets/stations/delaware.txt', 'app/assets/stations/hawaii.txt',
          'app/assets/stations/louisiana.txt', 'app/assets/stations/maine.txt',
          'app/assets/stations/maryland.txt', 'app/assets/stations/massachusetts.txt',
          'app/assets/stations/mississippi.txt', 'app/assets/stations/new_hampshire.txt',
          'app/assets/stations/new_jersey.txt', 'app/assets/stations/new_york.txt',
          'app/assets/stations/north_carolina.txt', 'app/assets/stations/oregon.txt',
          'app/assets/stations/pennsylvania.txt', 'app/assets/stations/rhode_island.txt',
          'app/assets/stations/south_carolina.txt', 'app/assets/stations/texas.txt',
          'app/assets/stations/virginia.txt', 'app/assets/stations/washington.txt']


files.each do |file|
  File.open(file).each do |line|
    if line.include?('stationid') && line.include?('latitude') &&
      line.include?('pred_type') && line.include?('longitude')
      station_hash = hash_config(line)
      station = Station.create(url: station_hash[:url], station_id: station_hash[:station_id], lat: station_hash[:lat], lon: station_hash[:lon], location: station_hash[:location], pred_type: station_hash[:pred_type], state: file[(file.index('stations/') + 9)..-5].gsub('_', ' ').titleize)
    end
    def hash_config(l)
      hash = {}
      hash[:url] = l[(l.index('a href') + 8)..(l.index('a href') + 43)]
      hash[:station_id] = hash[:url][-7..-1]
      hash[:lat] = l[(l.index('latitude') + 10)..(l.index('latitude') + 17)]
      hash[:lon] = l[(l.index('longitude') + 11)..(l.index('longitude') + 18)]
      hash[:location] = l[(l.index('a href') + 46)..(l.index('</a></td>') - 1)]
      hash[:pred_type] = l[(l.index('pred_type') + 11)..(l.index('</td></tr>') - 1)]
      hash
    end
  end
end
