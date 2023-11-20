class CreateKitchens < ActiveRecord::Migration[7.1]
  def change
    create_table :kitchens do |t|
      t.string :name
      t.string :address
      t.integer :capacity
      t.integer :price
      t.text :equipment
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
