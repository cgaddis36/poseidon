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
      station = Station.create(url: station_hash[:url],
                               station_id: station_hash[:station_id],
                               lat: station_hash[:lat],
                               lon: station_hash[:lon],
                               location: station_hash[:location],
                               pred_type: station_hash[:pred_type],
                               state: file[(file.index('stations/') + 9)..-5].gsub('_', ' ').titleize
                             )
    end

    def hash_config(l)
      station_hash = {}
      station_hash[:url] = l[(l.index('a href') + 8)..(l.index('a href') + 43)]
      station_hash[:station_id] = station_hash[:url][-7..-1]
      station_hash[:lat] = l[(l.index('latitude') + 11)..(l.index('latitude') + 17)]
      station_hash[:lon] = l[(l.index('longitude') + 11)..(l.index('longitude') + 18)]
      station_hash[:location] = l[(l.index('a href') + 46)..(l.index('</a></td>') - 1)]
      station_hash[:pred_type] = l[(l.index('pred_type') + 11)..(l.index('</td></tr>') - 1)]
      station_hash
    end
  end
end

Store.create(name: 'Half Hitch Bait & Tackle',
             address: '621 Harbor Blvd',
             city: 'Destin',
             state: 'FL',
             zip: '32541',
             url: 'www.halfhitch.com',
             phone_number: '(850) 837-3121',
             description: 'Locally owned and operated Saltwater Live Bait & Tackle Store. Will serve all your needs from offshore deepsea reels and live shrimp, to inshore lures and flourocarbon',
             bait: true,
             public: true)
Store.create(name: 'Bass Pro Shops',
             address: '4301 Legendary Dr',
             city: 'Destin',
             state: 'FL',
             zip: '32541',
             url: 'www.basspro.com',
             phone_number: '(850) 269-6200',
             description: 'One of the largest saltwater BassProShops, worth the visit. Have everything you could need while fishing in Destin aside from Live Bait',
             bait: true,
             fly: true,
             public: true)

 def zipcode_lookup(lat, lon)
   zipcode_array = []
   if (json_data = Geocoder.search([lat, lon])) && (address_hash = json_data[0].data["address"]) && (zipcode = address_hash["postcode"])
     zipcode_array << zipcode
   end
   zipcode_array
 end

 Station.all[0..1500].each do |station|
   station.update!(zipcodes: zipcode_lookup(station[:lat], station[:lon]))
 end

 Station.all[1501..2000].each do |station|
   station.update!(zipcodes: zipcode_lookup(station[:lat], station[:lon]))
 end

 Station.all[2001..-1].each do |station|
   station.update!(zipcodes: zipcode_lookup(station[:lat], station[:lon]))
 end
