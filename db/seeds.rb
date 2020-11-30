# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
files = ['app/assets/stations/florida.txt', 'app/assets/stations/alabama.txt',
         'app/assets/stations/georgia.txt', 'app/assets/stations/alaska.txt',
         'app/assets/stations/california.txt']

files.each do |file|
  File.open(file).each do |line|
    if line.include?('stationid') && line.include?('latitude') &&
      line.include?('pred_type') && line.include?('longitude')
      station_hash = hash_config(line)
      station = Station.create(url: station_hash[:url], station_id: station_hash[:station_id], lat: station_hash[:lat], lon: station_hash[:lon], location: station_hash[:location], pred_type: station_hash[:pred_type], state: file[(file.index('stations/') + 9)..-5].capitalize)
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
