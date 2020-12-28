require "application_system_test_case"

class HazardousGoodsTest < ApplicationSystemTestCase
  setup do
    @hazardous_good = hazardous_goods(:one)
  end

  test "visiting the index" do
    visit hazardous_goods_url
    assert_selector "h1", text: "Hazardous Goods"
  end

  test "creating a Hazardous good" do
    visit hazardous_goods_url
    click_on "New Hazardous Good"

    fill_in "Name", with: @hazardous_good.name
    fill_in "Packing group", with: @hazardous_good.packing_group
    fill_in "Primary class", with: @hazardous_good.primary_class
    fill_in "Secondary class", with: @hazardous_good.secondary_class
    fill_in "Tunnel code", with: @hazardous_good.tunnel_code
    fill_in "Un number", with: @hazardous_good.un_number
    click_on "Create Hazardous good"

    assert_text "Hazardous good was successfully created"
    click_on "Back"
  end

  test "updating a Hazardous good" do
    visit hazardous_goods_url
    click_on "Edit", match: :first

    fill_in "Name", with: @hazardous_good.name
    fill_in "Packing group", with: @hazardous_good.packing_group
    fill_in "Primary class", with: @hazardous_good.primary_class
    fill_in "Secondary class", with: @hazardous_good.secondary_class
    fill_in "Tunnel code", with: @hazardous_good.tunnel_code
    fill_in "Un number", with: @hazardous_good.un_number
    click_on "Update Hazardous good"

    assert_text "Hazardous good was successfully updated"
    click_on "Back"
  end

  test "destroying a Hazardous good" do
    visit hazardous_goods_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hazardous good was successfully destroyed"
  end
end
