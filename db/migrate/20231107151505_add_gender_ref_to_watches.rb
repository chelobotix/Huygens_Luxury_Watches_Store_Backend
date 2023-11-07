class AddGenderRefToWatches < ActiveRecord::Migration[7.0]
  def change
    add_reference :watches, :gender, null: false, foreign_key: true
  end
end
