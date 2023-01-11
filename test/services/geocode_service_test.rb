require 'test_helper'

class GeocodeServiceTest < ActiveSupport::TestCase

  test "call with Istanbul address" do
    address = "Istanbul"
    geocode = GeocodeService.call(address)
    assert_in_delta 41.01, geocode[:lat], 0.01
    assert_in_delta 28.97, geocode[:lon], 0.01
    assert_equal "tr", geocode[:country_code]
    assert_equal "34126", geocode[:postcode]
  end

end