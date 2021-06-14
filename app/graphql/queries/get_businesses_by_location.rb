module Queries
  class GetBusinessesByLocation < Queries::BaseQuery
    type [Types::BusinessType], null: false
    argument :zip, String, required: true
    argument :service_id, String, required: true
    argument :distance, String, required: true

    def resolve(zip:, service_id:, distance:)
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
      def geocode(zip)
        Geocoder.search(zip, params: {countrycodes: 'us'})
      end
      input_data = geocode(zip)
      if !input_data.empty?
        input_data = input_data[0].data
        input_lat = input_data["lat"][0..6]
        input_lon = input_data["lon"][0..6]
        state = state_hash.key(input_data["address"]["state"])
      else raise GraphQL::ExecutionError, "Zipcode does not exist, try another US Zipcode"
      end
      businesses = Business.where(state: state).joins(:services).where("services.id = ?", service_id)
      if !businesses.empty?
        closeby_businesses = []
        businesses.each do |business|
          business_data = geocode(business.zip)
          calculated_distance = Geocoder::Calculations.distance_between([business_data[0].data["lat"][0..6].to_f,business_data[0].data["lon"][0..6].to_f], [input_lat.to_f,input_lon.to_f], options = {units: :mi})
          if calculated_distance <= distance.to_i
            closeby_businesses << business
          end
        end
        closeby_businesses
      else raise GraphQL::ExecutionError, "There are currently no Businesses in this location saved to our database, try entering one below and we will verify the information as soon as we get done fishing!"
      end
    end
  end
end
