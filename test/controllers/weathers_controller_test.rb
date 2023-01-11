require "test_helper"

class WeathersControllerTest < ActionDispatch::IntegrationTest

  test "show with an input address" do
    address = Faker::Address.full_address
    get weathers_show_url, params: { address: address }
    assert_response :success
  end

end