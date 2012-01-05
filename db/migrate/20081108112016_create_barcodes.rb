class CreateBarcodes < ActiveRecord::Migration
  def self.up
    create_table :barcodes do |t|
      t.string :code_word
      t.binary :data

      t.timestamps
    end
  end

  def self.down
    drop_table :barcodes
  end
end
