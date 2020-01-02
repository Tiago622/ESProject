class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :acronym
      t.string :address
      t.references :organic_unit, foreign_key: true

      t.timestamps
    end
  end
end
