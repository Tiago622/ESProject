class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.string :school_year
      t.string :year
      t.string :class
      t.integer :version
      t.belongs_to :course, foreign_key: true

      t.timestamps
    end
  end
end
