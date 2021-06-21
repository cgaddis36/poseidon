stations = StationsFacade.new.build_stations

fly_shop = Service.create(name: "Fly Shop")
bait_shop = Service.create(name: "Bait Shop")
fishing_guide = Service.create(name: "Fishing Guide")
hunting_guide = Service.create(name: "Hunting Guide")
adventure_guide = Service.create(name: "Adventure Guide")

user = User.create(email: "billdance@example.com",
  password: "bass1234",
  first_name: "Bill",
  last_name: "Dance",
  user_name: "bassmaster32",
  zip: "32541")

#Florida Panhandle
        fl_business1 = Business.create(name: 'Half Hitch Bait & Tackle',
                     address: '621 Harbor Blvd',
                     city: 'Destin',
                     state: 'FL',
                     zip: '32541',
                     url: 'www.halfhitch.com',
                     phone_number: '(850) 837-3121',
                     description: 'Locally owned and operated Saltwater Live Bait & Tackle Store. Will serve all your needs from offshore deepsea reels and frozen cigar minnows, to inshore lures and flourocarbon',
                     public: true)
        BusinessService.create(business_id: fl_business1.id,
                                service_id: bait_shop.id)

        fl_business2 = Business.create(name: 'Bass Pro Shops',
                     address: '4301 Legendary Dr',
                     city: 'Destin',
                     state: 'FL',
                     zip: '32541',
                     url: 'www.basspro.com',
                     phone_number: '(850) 269-6200',
                     description: 'Your typical saltwater Bass Pro Shops. Have everything you could need while fishing in Destin. Conventional Rods & Reels & Tackle, Basic Fly Gear',
                     public: true)
         BusinessService.create(business_id: fl_business2.id,
                                 service_id: fly_shop.id)
         BusinessService.create(business_id: fl_business2.id,
                                 service_id: bait_shop.id)

         fl_business3 = Business.create(name: 'Orvis Sandestin',
                      address: '625 Grand Blvd',
                      city: 'Sandestin',
                      state: 'FL',
                      zip: '32550',
                      url: 'www.orvis.com',
                      phone_number: '(850) 650-2174',
                      description: 'Nice orvis store stocked with a large selection and variety of saltwater flyfishing gear. Still has their usual freshwater lineup as well.',
                      public: true)

         BusinessService.create(business_id: fl_business3.id,
                                 service_id: fly_shop.id)

        fl_business4 = Business.create(name: 'Old Florida Outfitters',
                     address: '30 Watercolor Blvd N Unit 101',
                     city: 'Santa Rosa Beach',
                     state: 'FL',
                     zip: '32459',
                     url: 'www.oldfloridaoutfitters.com',
                     phone_number: '(850) 534-4343',
                     description: 'Local fly fishing shop stocked with all of your fly essentials for saltwater and beach flyfishing. Very knowledgeable and experienced shop workers.',
                     public: true)

        BusinessService.create(business_id: fl_business4.id,
                                service_id: fly_shop.id)

        fl_business5 = Business.create(name: 'Emerald Coast Bait & Tackle',
                     address: '218 Eglin Pkwy NE',
                     city: 'Fort Walton Beach',
                     state: 'FL',
                     zip: '32547',
                     url: 'www.facebook.com/emeraldcoastbaitandtackle/',
                     phone_number: '(850) 362-6128',
                     description: 'Local bait, tackle and flyfishing store. One-stop shop that has more tackle and product than most stores in the area.',
                     public: true)

        BusinessService.create(business_id: fl_business5.id,
                               service_id: fly_shop.id)

        BusinessService.create(business_id: fl_business5.id,
                                service_id: bait_shop.id)

        fl_business6 = Business.create(name: 'Bay Baits',
                     address: '24295 US-331 Unit B',
                     city: 'Santa Rosa Beach',
                     state: 'FL',
                     zip: '32459',
                     url: 'www.baybaits.com',
                     phone_number: '(850) 278-6292',
                     description: 'Bait shop on the southside of Choctawhatchee Bay right at the base of the 331 bridge coming into Santa Rosa Beach. Carries live shrimp, frozen bait and inshore tackle',
                     public: true)

        BusinessService.create(business_id: fl_business6.id,
                               service_id: fly_shop.id)

        BusinessService.create(business_id: fl_business6.id,
                                service_id: bait_shop.id)

#End Florida Panhandle
#--------------------------------------------------------------------------------------------------------------------
#Front Range Colorado
co_business1 = Business.create(name: 'Trouts Fly Fishing',
             address: '1025 Zuni St',
             city: 'Denver',
             state: 'CO',
             zip: '80204',
             url: 'www.troutsflyfishing.com',
             phone_number: '(303) 733-1434',
             average_rating: 5,
             description: 'Fly fishing store with all of your essential river basics and more. From the newest Ross and Abel reels, to offering beginners fly-fishing classes on the Platte, this store has most anything you could be looking for.',
             public: true)

bs1 = BusinessService.create(business_id: co_business1.id,
                       service_id: fly_shop.id)
bs2 = BusinessService.create(business_id: co_business1.id,
                      service_id: fishing_guide.id)
bs1.reviews.create(user_id: user.id,
                    title: "Favorite Fly shop in Denver",
                    comment: "Well known fly shop located right on the South Platte river in the heart of Downtown Denver. Stocked with all of your river essentials, helped me get started flyfishing when I first came to the area.",
                    rating: 5)


#End Front Range Colorado
