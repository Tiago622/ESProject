class CreateLessonSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :lesson_schedules do |t|
      t.references :lesson, foreign_key: true
      t.references :schedule, foreign_key: true

      t.timestamps
    end
  end
end
