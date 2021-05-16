module Queries
  class ClosestStation < Queries::BaseQuery
    type Types::StationType, null: false
    argument :zip, String, required: true

    def resolve(zip:)
      state_hash = {
        'AL' => 'Alabama',
        'AK' => 'Alaska',
        'AS' => 'America Samoa',
        'AZ' => 'Arizona',
        'AR' => 'Arkansas',
        'CA' => 'California',
        'CO' => 'Colorado',
        'CT' => 'Connecticut',
        'DE' => 'Delaware',
        'DC' => 'District of Columbia',
        'FM' => 'Federated States Of Micronesia',
        'FL' => 'Florida',
        'GA' => 'Georgia',
        'GU' => 'Guam',
        'HI' => 'Hawaii',
        'ID' => 'Idaho',
        'IL' => 'Illinois',
        'IN' => 'Indiana',
        'IA' => 'Iowa',
        'KS' => 'Kansas',
        'KY' => 'Kentucky',
        'LA' => 'Louisiana',
        'ME' => 'Maine',
        'MH' => 'Marshall Islands',
        'MD' => 'Maryland',
        'MA' => 'Massachusetts',
        'MI' => 'Michigan',
        'MN' => 'Minnesota',
        'MS' => 'Mississippi',
        'MO' => 'Missouri',
        'MT' => 'Montana',
        'NE' => 'Nebraska',
        'NV' => 'Nevada',
        'NH' => 'New Hampshire',
        'NJ' => 'New Jersey',
        'NM' => 'New Mexico',
        'NY' => 'New York',
        'NC' => 'North Carolina',
        'ND' => 'North Dakota',
        'OH' => 'Ohio',
        'OK' => 'Oklahoma',
        'OR' => 'Oregon',
        'PW' => 'Palau',
        'PA' => 'Pennsylvania',
        'PR' => 'Puerto Rico',
        'RI' => 'Rhode Island',
        'SC' => 'South Carolina',
        'SD' => 'South Dakota',
        'TN' => 'Tennessee',
        'TX' => 'Texas',
        'UT' => 'Utah',
        'VT' => 'Vermont',
        'VI' => 'Virgin Island',
        'VA' => 'Virginia',
        'WA' => 'Washington',
        'WV' => 'West Virginia',
        'WI' => 'Wisconsin',
        'WY' => 'Wyoming'
      }
      data = Geocoder.search(zip, params: {countrycodes: 'us'})
      if !data.empty?
        data = data[0].data
        lat = data["lat"][0..6]
        lon = data["lon"][0..6]
        state = state_hash.key(data["address"]["state"])
      else raise GraphQL::ExecutionError, "Zipcode does not exist, try another US Zipcode"
      end
      stations = Station.where(state: state)
      if !stations.empty?
        closest = nil
        closest_distance = nil
        stations.each do |station|
          distance = Geocoder::Calculations.distance_between([station[:lat].to_f,station[:lon].to_f], [lat.to_f,lon.to_f])
          if closest_distance.nil? || distance.abs < closest_distance
            closest = station
            closest_distance = distance.abs
          end
        end
        closest
      else raise GraphQL::ExecutionError, "Zipcode is not in a state with tide prediction data from NOAA, please enter a correct zipcode to continue. Try: 32541"
      end
    end
  end
end
