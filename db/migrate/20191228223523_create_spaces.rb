class CreateSpaces < ActiveRecord::Migration[5.2]
  def change
    create_table :spaces do |t|
      t.string :name
      t.string :type_of_space
      t.string :capacity
      t.string :description
      t.boolean :availability
      t.string :equipment

      t.timestamps
    end
  end
end
