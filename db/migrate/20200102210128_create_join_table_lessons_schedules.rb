class CreateJoinTableLessonsSchedules < ActiveRecord::Migration[5.2]
  def change
    create_join_table :lessons, :schedules do |t|
      t.belongs_to :lesson, index: true
      t.belongs_to :schedule, index: true
    end
  end
end
