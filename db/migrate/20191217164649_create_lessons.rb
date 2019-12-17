class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :name
      t.string :type
      t.integer :capacity
      t.boolean :availability
      t.string :equipment

      t.timestamps
    end
  end
end
