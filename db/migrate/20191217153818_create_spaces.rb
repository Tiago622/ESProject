class CreateSpaces < ActiveRecord::Migration[5.2]
  def change
    create_table :spaces do |t|
      t.string :name
      t.string :room_type
      t.integer :capacity
      t.string :equipment
      t.boolean :availability

      t.timestamps
    end
  end
end
