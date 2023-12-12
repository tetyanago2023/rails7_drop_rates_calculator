require "test_helper"

class DropratesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @droprate = droprates(:one)
  end

  test "should get index" do
    get droprates_url
    assert_response :success
  end

  test "should get new" do
    get new_droprate_url
    assert_response :success
  end

  test "should create droprate" do
    assert_difference("Droprate.count") do
      post droprates_url, params: { droprate: { boss_kills: @droprate.boss_kills, drop_chance: @droprate.drop_chance, item_name: @droprate.item_name, killed_per_drop: @droprate.killed_per_drop } }
    end

    assert_redirected_to droprate_url(Droprate.last)
  end

  test "should show droprate" do
    get droprate_url(@droprate)
    assert_response :success
  end

  test "should get edit" do
    get edit_droprate_url(@droprate)
    assert_response :success
  end

  test "should update droprate" do
    patch droprate_url(@droprate), params: { droprate: { boss_kills: @droprate.boss_kills, drop_chance: @droprate.drop_chance, item_name: @droprate.item_name, killed_per_drop: @droprate.killed_per_drop } }
    assert_redirected_to droprate_url(@droprate)
  end

  test "should destroy droprate" do
    assert_difference("Droprate.count", -1) do
      delete droprate_url(@droprate)
    end

    assert_redirected_to droprates_url
  end
end
