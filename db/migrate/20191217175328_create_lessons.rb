class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :name
      t.string :lesson_type
      t.string :week_day
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
