class GeocodeService 

    def self.call(address)
      response = Geocoder.search(address)
      response or raise IOError.new "Geocoder error"
      response.length > 0 or raise IOError.new "Geocoder response is empty: #{response}"
      response_data = response.first.data
      response_data or raise IOError.new "Geocoder response data error"
      response_data["lat"] or raise IOError.new "Geocoder latitude is empty"
      response_data["lon"] or raise IOError.new "Geocoder longitude is empty"
      response_data["address"] or raise IOError.new "Geocoder address is empty" 
      response_data["address"]["country_code"] or raise IOError.new "Geocoder country code is empty"
      response_data["address"]["postcode"] or raise IOError.new "Geocoder postal code is empty" 
      result = Hash.new
      result[:lat] = response_data["lat"].to_f
      result[:lon] = response_data["lon"].to_f
      result[:country_code] = response_data["address"]["country_code"]
      result[:postcode] = response_data["address"]["postcode"]
      result
    end
  
  end