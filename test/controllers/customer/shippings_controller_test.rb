require 'test_helper'

class Customer::ShippingsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get customer_shippings_edit_url
    assert_response :success
  end

  test "should get index" do
    get customer_shippings_index_url
    assert_response :success
  end

end
