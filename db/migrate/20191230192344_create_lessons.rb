class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :name
      t.string :type_of_lesson
      t.string :weekday
      t.time :start_time
      t.time :end_time
      t.belongs_to :space, foreign_key: true
      t.belongs_to :person, foreign_key: true
      t.belongs_to :discipline, foreign_key: true

      t.timestamps
    end
  end
end
