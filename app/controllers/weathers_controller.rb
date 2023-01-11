class WeathersController < ApplicationController

  def show
    @default_address = "Istanbul"
    if params[:address]
      begin
        @address = params[:address]
        @geocode = GeocodeService.call(@address)
        @cache_key = "#{@geocode[:country_code]}/#{@geocode[:postcode]}"
        @cached = Rails.cache.exist?(@cache_key)
        @weather = Rails.cache.fetch(@cache_key, expires_in: 30 * 60) do
          WeatherService.call(@geocode[:lat], @geocode[:lon])          
        end
      rescue => e
        flash.alert = e.message
      end
    end
  end

end