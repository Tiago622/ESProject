require "application_system_test_case"

class LessonSchedulesTest < ApplicationSystemTestCase
  setup do
    @lesson_schedule = lesson_schedules(:one)
  end

  test "visiting the index" do
    visit lesson_schedules_url
    assert_selector "h1", text: "Lesson Schedules"
  end

  test "creating a Lesson schedule" do
    visit lesson_schedules_url
    click_on "New Lesson Schedule"

    fill_in "Lesson", with: @lesson_schedule.lesson_id
    fill_in "Schedule", with: @lesson_schedule.schedule_id
    click_on "Create Lesson schedule"

    assert_text "Lesson schedule was successfully created"
    click_on "Back"
  end

  test "updating a Lesson schedule" do
    visit lesson_schedules_url
    click_on "Edit", match: :first

    fill_in "Lesson", with: @lesson_schedule.lesson_id
    fill_in "Schedule", with: @lesson_schedule.schedule_id
    click_on "Update Lesson schedule"

    assert_text "Lesson schedule was successfully updated"
    click_on "Back"
  end

  test "destroying a Lesson schedule" do
    visit lesson_schedules_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lesson schedule was successfully destroyed"
  end
end
