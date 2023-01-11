require 'test_helper'

class WeatherServiceTest < ActiveSupport::TestCase

  test "call with Istanbul latitude and longitude" do
    lat = 41.008240
    lon = 28.978359
    weather = WeatherService.call(lat, lon)
    assert_includes -50..50, weather[:temp]
    assert_includes -50..50, weather[:temp_min]
    assert_includes -50..50, weather[:temp_max]
    assert_includes 0..100, weather[:humidity]
    assert_includes 1000..1100, weather[:pressure]
    refute_empty weather[:desc]
  end

end