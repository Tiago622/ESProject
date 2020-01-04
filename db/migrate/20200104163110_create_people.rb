class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name
      t.string :phone
      t.string :extension
      t.string :email
      t.string :cabinet
      t.string :job_title_1
      t.string :job_title_2
      t.string :job_title_3

      t.timestamps
    end
  end
end
