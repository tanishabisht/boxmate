require "application_system_test_case"

class CheffsTest < ApplicationSystemTestCase
  setup do
    @cheff = cheffs(:one)
  end

  test "visiting the index" do
    visit cheffs_url
    assert_selector "h1", text: "Cheffs"
  end

  test "should create cheff" do
    visit cheffs_url
    click_on "New cheff"

    fill_in "Booked num", with: @cheff.booked_num
    fill_in "Cuisine", with: @cheff.cuisine
    fill_in "Day", with: @cheff.day
    fill_in "Max num", with: @cheff.max_num
    fill_in "Meal", with: @cheff.meal
    fill_in "Price", with: @cheff.price
    fill_in "Time", with: @cheff.time
    click_on "Create Cheff"

    assert_text "Cheff was successfully created"
    click_on "Back"
  end

  test "should update Cheff" do
    visit cheff_url(@cheff)
    click_on "Edit this cheff", match: :first

    fill_in "Booked num", with: @cheff.booked_num
    fill_in "Cuisine", with: @cheff.cuisine
    fill_in "Day", with: @cheff.day
    fill_in "Max num", with: @cheff.max_num
    fill_in "Meal", with: @cheff.meal
    fill_in "Price", with: @cheff.price
    fill_in "Time", with: @cheff.time
    click_on "Update Cheff"

    assert_text "Cheff was successfully updated"
    click_on "Back"
  end

  test "should destroy Cheff" do
    visit cheff_url(@cheff)
    click_on "Destroy this cheff", match: :first

    assert_text "Cheff was successfully destroyed"
  end
end
