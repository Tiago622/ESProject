require "application_system_test_case"

class OrganicUnitsTest < ApplicationSystemTestCase
  setup do
    @organic_unit = organic_units(:one)
  end

  test "visiting the index" do
    visit organic_units_url
    assert_selector "h1", text: "Organic Units"
  end

  test "creating a Organic unit" do
    visit organic_units_url
    click_on "New Organic Unit"

    fill_in "Acronym", with: @organic_unit.acronym
    fill_in "Name", with: @organic_unit.name
    click_on "Create Organic unit"

    assert_text "Organic unit was successfully created"
    click_on "Back"
  end

  test "updating a Organic unit" do
    visit organic_units_url
    click_on "Edit", match: :first

    fill_in "Acronym", with: @organic_unit.acronym
    fill_in "Name", with: @organic_unit.name
    click_on "Update Organic unit"

    assert_text "Organic unit was successfully updated"
    click_on "Back"
  end

  test "destroying a Organic unit" do
    visit organic_units_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Organic unit was successfully destroyed"
  end
end
