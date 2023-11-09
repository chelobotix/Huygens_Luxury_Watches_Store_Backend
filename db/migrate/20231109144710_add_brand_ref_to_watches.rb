class AddBrandRefToWatches < ActiveRecord::Migration[7.0]
  def change
    add_reference :watches, :brand, null: false, foreign_key: true
  end
end
