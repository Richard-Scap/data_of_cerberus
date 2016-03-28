class CreatePrinters < ActiveRecord::Migration
  def change
    create_table :printers do |t|
      t.string :company
      t.string :number
      t.string :address
      t.float :rating
      t.string :url
      t.integer :city_id

      t.timestamps null: false
    end
  end
end
