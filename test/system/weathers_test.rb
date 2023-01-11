require "application_system_test_case"

class WeathersTest < ApplicationSystemTestCase

  test "show" do
    address = Faker::Address.full_address
    visit url_for \
      controller: "weathers", 
      action: "show", 
      params: { 
        address: address 
      }
    assert_selector "h1", text: "Weather Forecast Demo"
  end

end