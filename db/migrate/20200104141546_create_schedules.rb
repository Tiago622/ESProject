class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.string :school_year
      t.string :year
      t.string :schedule_class
      t.string :version
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
