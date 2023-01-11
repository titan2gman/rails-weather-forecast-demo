class WeatherService
    
    def self.call(lat, lon)
      conn = Faraday.new("https://api.openweathermap.org") do |f|
        f.request :json
        f.request :retry
        f.response :json
        f.adapter :net_http
      end
      response = conn.get('/data/2.5/weather') do |req|
        req.params[:appid] = Rails.application.credentials.openweather_api_key
        req.params[:lat] = lat
        req.params[:lon] = lon
        req.params[:units] = "metric"
      end
      response_body = response.body
      response_body or raise IOError.new "OpenWeather response error"
      response_body["main"] or raise IOError.new "OpenWeather response main is empty"
      response_body["main"]["temp"] or raise IOError.new "OpenWeather temperature is empty"
      response_body["main"]["temp_min"] or raise IOError.new "OpenWeather temperature minimum is empty"
      response_body["main"]["temp_max"] or raise IOError.new "OpenWeather temperature maximum is empty"
      response_body["weather"] or raise IOError.new "OpenWeather response weather error"
      response_body["weather"].length > 0 or raise IOError.new "OpenWeather response weather is empty"
      response_body["weather"][0]["description"] or raise IOError.new "OpenWeather weather description is empty"
      result = Hash.new
      result[:temp] = response_body["main"]["temp"]
      result[:temp_min] = response_body["main"]["temp_min"]
      result[:temp_max] = response_body["main"]["temp_max"]
      result[:humidity] = response_body["main"]["humidity"]
      result[:pressure] = response_body["main"]["pressure"]
      result[:desc] = response_body["weather"][0]["description"]
      result
    end
      
  end