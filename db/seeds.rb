stations = StationsFacade.new.build_stations

Business.create(name: 'Half Hitch Bait & Tackle',
             address: '621 Harbor Blvd',
             city: 'Destin',
             state: 'FL',
             zip: '32541',
             url: 'www.halfhitch.com',
             phone_number: '(850) 837-3121',
             description: 'Locally owned and operated Saltwater Live Bait & Tackle Store. Will serve all your needs from offshore deepsea reels and live shrimp, to inshore lures and flourocarbon',
             public: true)
Business.create(name: 'Bass Pro Shops',
             address: '4301 Legendary Dr',
             city: 'Destin',
             state: 'FL',
             zip: '32541',
             url: 'www.basspro.com',
             phone_number: '(850) 269-6200',
             description: 'Your typical saltwater Bass Pro Shops. Have everything you could need while fishing in Destin. Conventional Rods & Reels & Tackle, Basic Fly Gear',
             public: true)

 def zipcode_lookup(lat, lon)
   zipcode_array = []
   if (json_data = Geocoder.search([lat, lon])) && (address_hash = json_data[0].data["address"]) && (zipcode = address_hash["postcode"])
     zipcode_array << zipcode
   end
   zipcode_array
 end
