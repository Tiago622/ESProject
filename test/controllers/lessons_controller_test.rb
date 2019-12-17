require 'test_helper'

class LessonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lesson = lessons(:one)
  end

  test "should get index" do
    get lessons_url
    assert_response :success
  end

  test "should get new" do
    get new_lesson_url
    assert_response :success
  end

  test "should create lesson" do
    assert_difference('Lesson.count') do
<<<<<<< HEAD
      post lessons_url, params: { lesson: { end_time: @lesson.end_time, lesson_type: @lesson.lesson_type, name: @lesson.name, start_time: @lesson.start_time, week_day: @lesson.week_day } }
=======
      post lessons_url, params: { lesson: { end_time: @lesson.end_time, lesson_type: @lesson.lesson_type, name: @lesson.name, school_year: @lesson.school_year, start_time: @lesson.start_time, teacher: @lesson.teacher, weekday: @lesson.weekday } }
>>>>>>> JoaoFerreira
    end

    assert_redirected_to lesson_url(Lesson.last)
  end

  test "should show lesson" do
    get lesson_url(@lesson)
    assert_response :success
  end

  test "should get edit" do
    get edit_lesson_url(@lesson)
    assert_response :success
  end

  test "should update lesson" do
<<<<<<< HEAD
    patch lesson_url(@lesson), params: { lesson: { end_time: @lesson.end_time, lesson_type: @lesson.lesson_type, name: @lesson.name, start_time: @lesson.start_time, week_day: @lesson.week_day } }
=======
    patch lesson_url(@lesson), params: { lesson: { end_time: @lesson.end_time, lesson_type: @lesson.lesson_type, name: @lesson.name, school_year: @lesson.school_year, start_time: @lesson.start_time, teacher: @lesson.teacher, weekday: @lesson.weekday } }
>>>>>>> JoaoFerreira
    assert_redirected_to lesson_url(@lesson)
  end

  test "should destroy lesson" do
    assert_difference('Lesson.count', -1) do
      delete lesson_url(@lesson)
    end

    assert_redirected_to lessons_url
  end
end
