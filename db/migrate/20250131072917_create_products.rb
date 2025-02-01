class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.references :category, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :price
      t.string :unit

      t.timestamps
    end
  end
end
