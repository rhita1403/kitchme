class CreateKitchens < ActiveRecord::Migration[7.1]
  def change
    create_table :kitchens do |t|
      t.string :name
      t.text :address
      t.integer :capacity
      t.date :availability
      t.integer :price
      t.text :equipment

      t.timestamps
    end
  end
end
