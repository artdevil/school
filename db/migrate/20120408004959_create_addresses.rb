class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :line_1
      t.string :line_2
      t.string :city
      t.string :province
      t.string :country
      t.string :telephone
      t.string :mobile
      t.references :addressable, :polymorphic => true
      t.timestamps
    end
  end
end
