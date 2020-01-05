require 'test_helper'

class LessonSchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lesson_schedule = lesson_schedules(:one)
  end

  test "should get index" do
    get lesson_schedules_url
    assert_response :success
  end

  test "should get new" do
    get new_lesson_schedule_url
    assert_response :success
  end

  test "should create lesson_schedule" do
    assert_difference('LessonSchedule.count') do
      post lesson_schedules_url, params: { lesson_schedule: { lesson_id: @lesson_schedule.lesson_id, schedule_id: @lesson_schedule.schedule_id } }
    end

    assert_redirected_to lesson_schedule_url(LessonSchedule.last)
  end

  test "should show lesson_schedule" do
    get lesson_schedule_url(@lesson_schedule)
    assert_response :success
  end

  test "should get edit" do
    get edit_lesson_schedule_url(@lesson_schedule)
    assert_response :success
  end

  test "should update lesson_schedule" do
    patch lesson_schedule_url(@lesson_schedule), params: { lesson_schedule: { lesson_id: @lesson_schedule.lesson_id, schedule_id: @lesson_schedule.schedule_id } }
    assert_redirected_to lesson_schedule_url(@lesson_schedule)
  end

  test "should destroy lesson_schedule" do
    assert_difference('LessonSchedule.count', -1) do
      delete lesson_schedule_url(@lesson_schedule)
    end

    assert_redirected_to lesson_schedules_url
  end
end
