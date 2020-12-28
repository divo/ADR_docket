require 'test_helper'

class HazardousGoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hazardous_good = hazardous_goods(:one)
  end

  test "should get index" do
    get hazardous_goods_url
    assert_response :success
  end

  test "should get new" do
    get new_hazardous_good_url
    assert_response :success
  end

  test "should create hazardous_good" do
    assert_difference('HazardousGood.count') do
      post hazardous_goods_url, params: { hazardous_good: { name: @hazardous_good.name, packing_group: @hazardous_good.packing_group, primary_class: @hazardous_good.primary_class, secondary_class: @hazardous_good.secondary_class, tunnel_code: @hazardous_good.tunnel_code, un_number: @hazardous_good.un_number } }
    end

    assert_redirected_to hazardous_good_url(HazardousGood.last)
  end

  test "should show hazardous_good" do
    get hazardous_good_url(@hazardous_good)
    assert_response :success
  end

  test "should get edit" do
    get edit_hazardous_good_url(@hazardous_good)
    assert_response :success
  end

  test "should update hazardous_good" do
    patch hazardous_good_url(@hazardous_good), params: { hazardous_good: { name: @hazardous_good.name, packing_group: @hazardous_good.packing_group, primary_class: @hazardous_good.primary_class, secondary_class: @hazardous_good.secondary_class, tunnel_code: @hazardous_good.tunnel_code, un_number: @hazardous_good.un_number } }
    assert_redirected_to hazardous_good_url(@hazardous_good)
  end

  test "should destroy hazardous_good" do
    assert_difference('HazardousGood.count', -1) do
      delete hazardous_good_url(@hazardous_good)
    end

    assert_redirected_to hazardous_goods_url
  end
end
