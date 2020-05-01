require 'test_helper'

class ShippingOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shipping_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get shipping_orders_show_url
    assert_response :success
  end

end
