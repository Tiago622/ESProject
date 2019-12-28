class CreateSpaces < ActiveRecord::Migration[5.2]
  def change
    create_table :spaces do |t|
      t.string :name
      t.string :type
      t.string :capacity
      t.boolean :availability
      t.string :equipment

      t.timestamps
    end
  end
end
