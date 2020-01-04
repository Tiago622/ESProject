require "application_system_test_case"

class PeopleTest < ApplicationSystemTestCase
  setup do
    @person = people(:one)
  end

  test "visiting the index" do
    visit people_url
    assert_selector "h1", text: "People"
  end

  test "creating a Person" do
    visit people_url
    click_on "New Person"

    fill_in "Cabinet", with: @person.cabinet
    fill_in "Email", with: @person.email
    fill_in "Extension", with: @person.extension
    fill_in "Job title 1", with: @person.job_title_1
    fill_in "Job title 2", with: @person.job_title_2
    fill_in "Job title 3", with: @person.job_title_3
    fill_in "Name", with: @person.name
    fill_in "Phone", with: @person.phone
    click_on "Create Person"

    assert_text "Person was successfully created"
    click_on "Back"
  end

  test "updating a Person" do
    visit people_url
    click_on "Edit", match: :first

    fill_in "Cabinet", with: @person.cabinet
    fill_in "Email", with: @person.email
    fill_in "Extension", with: @person.extension
    fill_in "Job title 1", with: @person.job_title_1
    fill_in "Job title 2", with: @person.job_title_2
    fill_in "Job title 3", with: @person.job_title_3
    fill_in "Name", with: @person.name
    fill_in "Phone", with: @person.phone
    click_on "Update Person"

    assert_text "Person was successfully updated"
    click_on "Back"
  end

  test "destroying a Person" do
    visit people_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Person was successfully destroyed"
  end
end
