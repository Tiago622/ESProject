class AddSpaceToLessons < ActiveRecord::Migration[5.2]
  def change
    add_reference :lessons, :space, foreign_key: true
  end
end
