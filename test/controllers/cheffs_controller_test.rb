require "test_helper"

class CheffsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cheff = cheffs(:one)
  end

  test "should get index" do
    get cheffs_url
    assert_response :success
  end

  test "should get new" do
    get new_cheff_url
    assert_response :success
  end

  test "should create cheff" do
    assert_difference("Cheff.count") do
      post cheffs_url, params: { cheff: { booked_num: @cheff.booked_num, cuisine: @cheff.cuisine, day: @cheff.day, max_num: @cheff.max_num, meal: @cheff.meal, price: @cheff.price, time: @cheff.time } }
    end

    assert_redirected_to cheff_url(Cheff.last)
  end

  test "should show cheff" do
    get cheff_url(@cheff)
    assert_response :success
  end

  test "should get edit" do
    get edit_cheff_url(@cheff)
    assert_response :success
  end

  test "should update cheff" do
    patch cheff_url(@cheff), params: { cheff: { booked_num: @cheff.booked_num, cuisine: @cheff.cuisine, day: @cheff.day, max_num: @cheff.max_num, meal: @cheff.meal, price: @cheff.price, time: @cheff.time } }
    assert_redirected_to cheff_url(@cheff)
  end

  test "should destroy cheff" do
    assert_difference("Cheff.count", -1) do
      delete cheff_url(@cheff)
    end

    assert_redirected_to cheffs_url
  end
end
