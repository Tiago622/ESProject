require "application_system_test_case"

class SpacesTest < ApplicationSystemTestCase
  setup do
    @space = spaces(:one)
  end

  test "visiting the index" do
    visit spaces_url
    assert_selector "h1", text: "Spaces"
  end

  test "creating a Space" do
    visit spaces_url
    click_on "New Space"

    check "Availability" if @space.availability
    fill_in "Capacity", with: @space.capacity
    fill_in "Description", with: @space.description
    fill_in "Equipment", with: @space.equipment
    fill_in "Name", with: @space.name
    fill_in "Type of space", with: @space.type_of_space
    click_on "Create Space"

    assert_text "Space was successfully created"
    click_on "Back"
  end

  test "updating a Space" do
    visit spaces_url
    click_on "Edit", match: :first

    check "Availability" if @space.availability
    fill_in "Capacity", with: @space.capacity
    fill_in "Description", with: @space.description
    fill_in "Equipment", with: @space.equipment
    fill_in "Name", with: @space.name
    fill_in "Type of space", with: @space.type_of_space
    click_on "Update Space"

    assert_text "Space was successfully updated"
    click_on "Back"
  end

  test "destroying a Space" do
    visit spaces_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Space was successfully destroyed"
  end
end
