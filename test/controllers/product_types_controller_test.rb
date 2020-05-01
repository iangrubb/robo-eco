require 'test_helper'

class ProductTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get product_types_show_url
    assert_response :success
  end

end
