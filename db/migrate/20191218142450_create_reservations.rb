class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.date :date
      t.time :start_time
      t.time :end_time
      t.string :reason
      t.string :state

      t.timestamps
    end
  end
end
