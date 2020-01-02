class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.string :reason
      t.string :state
      t.date :date
      t.time :start_time
      t.time :end_time
      t.belongs_to :person, foreign_key: true
      t.belongs_to :space, foreign_key: true

      t.timestamps
    end
  end
end
