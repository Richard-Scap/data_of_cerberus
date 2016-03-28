class AddUniqueIndexOnPrinterPhoneNumber < ActiveRecord::Migration
  def change
    add_index :printers, :number, unique: true
  end
end
