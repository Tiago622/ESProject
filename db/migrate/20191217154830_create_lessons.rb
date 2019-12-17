class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :name
      t.string :teacher
      t.string :school_year
      t.string :lesson_type
      t.string :weekday
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
