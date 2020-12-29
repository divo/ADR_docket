require "application_system_test_case"

class DocketsTest < ApplicationSystemTestCase
  setup do
    @docket = dockets(:one)
  end

  test "visiting the index" do
    visit dockets_url
    assert_selector "h1", text: "Dockets"
  end

  test "creating a Docket" do
    visit dockets_url
    click_on "New Docket"

    fill_in "Collect from", with: @docket.collect_from_id
    fill_in "Customer reference no", with: @docket.customer_reference_no
    fill_in "Deliver to", with: @docket.deliver_to_id
    fill_in "Description", with: @docket.description
    fill_in "Equipment no", with: @docket.equipment_no
    fill_in "Hazardous good", with: @docket.hazardous_good_id
    check "Return empty" if @docket.return_empty
    fill_in "Seal no", with: @docket.seal_no
    click_on "Create Docket"

    assert_text "Docket was successfully created"
    click_on "Back"
  end

  test "updating a Docket" do
    visit dockets_url
    click_on "Edit", match: :first

    fill_in "Collect from", with: @docket.collect_from_id
    fill_in "Customer reference no", with: @docket.customer_reference_no
    fill_in "Deliver to", with: @docket.deliver_to_id
    fill_in "Description", with: @docket.description
    fill_in "Equipment no", with: @docket.equipment_no
    fill_in "Hazardous good", with: @docket.hazardous_good_id
    check "Return empty" if @docket.return_empty
    fill_in "Seal no", with: @docket.seal_no
    click_on "Update Docket"

    assert_text "Docket was successfully updated"
    click_on "Back"
  end

  test "destroying a Docket" do
    visit dockets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Docket was successfully destroyed"
  end
end
