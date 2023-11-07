class AddUniqueIndexToGender < ActiveRecord::Migration[7.0]
  def change
    add_index :genders, :sex, unique: true
  end
end
