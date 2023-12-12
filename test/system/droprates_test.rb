require "application_system_test_case"

class DropratesTest < ApplicationSystemTestCase
  setup do
    @droprate = droprates(:one)
  end

  test "visiting the index" do
    visit droprates_url
    assert_selector "h1", text: "Droprates"
  end

  test "should create droprate" do
    visit droprates_url
    click_on "New droprate"

    fill_in "Boss kills", with: @droprate.boss_kills
    fill_in "Drop chance", with: @droprate.drop_chance
    fill_in "Item name", with: @droprate.item_name
    fill_in "Killed per drop", with: @droprate.killed_per_drop
    click_on "Create Droprate"

    assert_text "Droprate was successfully created"
    click_on "Back"
  end

  test "should update Droprate" do
    visit droprate_url(@droprate)
    click_on "Edit this droprate", match: :first

    fill_in "Boss kills", with: @droprate.boss_kills
    fill_in "Drop chance", with: @droprate.drop_chance
    fill_in "Item name", with: @droprate.item_name
    fill_in "Killed per drop", with: @droprate.killed_per_drop
    click_on "Update Droprate"

    assert_text "Droprate was successfully updated"
    click_on "Back"
  end

  test "should destroy Droprate" do
    visit droprate_url(@droprate)
    click_on "Destroy this droprate", match: :first

    assert_text "Droprate was successfully destroyed"
  end
end
