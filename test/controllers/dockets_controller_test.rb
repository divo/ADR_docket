require 'test_helper'

class DocketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @docket = dockets(:one)
  end

  test "should get index" do
    get dockets_url
    assert_response :success
  end

  test "should get new" do
    get new_docket_url
    assert_response :success
  end

  test "should create docket" do
    assert_difference('Docket.count') do
      post dockets_url, params: { docket: { collect_from_id: @docket.collect_from_id, customer_reference_no: @docket.customer_reference_no, deliver_to_id: @docket.deliver_to_id, description: @docket.description, equipment_no: @docket.equipment_no, hazardous_good_id: @docket.hazardous_good_id, return_empty: @docket.return_empty, seal_no: @docket.seal_no } }
    end

    assert_redirected_to docket_url(Docket.last)
  end

  test "should show docket" do
    get docket_url(@docket)
    assert_response :success
  end

  test "should get edit" do
    get edit_docket_url(@docket)
    assert_response :success
  end

  test "should update docket" do
    patch docket_url(@docket), params: { docket: { collect_from_id: @docket.collect_from_id, customer_reference_no: @docket.customer_reference_no, deliver_to_id: @docket.deliver_to_id, description: @docket.description, equipment_no: @docket.equipment_no, hazardous_good_id: @docket.hazardous_good_id, return_empty: @docket.return_empty, seal_no: @docket.seal_no } }
    assert_redirected_to docket_url(@docket)
  end

  test "should destroy docket" do
    assert_difference('Docket.count', -1) do
      delete docket_url(@docket)
    end

    assert_redirected_to dockets_url
  end
end
