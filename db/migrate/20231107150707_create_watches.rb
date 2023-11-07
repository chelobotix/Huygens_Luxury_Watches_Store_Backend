class CreateWatches < ActiveRecord::Migration[7.0]
  def change
    create_table :watches do |t|
      t.string :name, null: false, unique: true
      t.integer :price, null: false
      t.string :video, null: true, unique: true
      t.string :reference, null: true
      t.string :collection, null: true
      t.string :movement, null: true
      t.string :caliber, null: true
      t.string :powerReserve, null: true
      t.date :dateAdded, null: true
      t.string :dialColor, null: true
      t.string :dialMaterial, null: true
      t.string :caseSize, null: true
      t.string :caseMaterial, null: true
      t.string :caseBack, null: true
      t.string :strapMaterial, null: true
      t.string :strapColor, null: true
      t.string :buckleType, null: true
      t.string :specialFeatures, null: true
      t.text :thumbnails, array: true, default: []
      t.text :images, array: true, default: []
      t.timestamps
    end
  end
end
