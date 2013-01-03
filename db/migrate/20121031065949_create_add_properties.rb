class CreateAddProperties < ActiveRecord::Migration
  def change
    create_table :add_properties do |t|
      t.string :area
      t.string :property_type
      t.string :house_number
      t.text :street_address
      t.string :city
      t.integer :pincode
      t.string :state
      t.string :country
      t.boolean :is_rented, :default => false 


      t.timestamps
    end
  end
end
