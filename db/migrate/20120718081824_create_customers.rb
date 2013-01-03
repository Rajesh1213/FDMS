class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :account_number
      t.string :reference_person
      t.integer :director_id
      t.integer :partner_id
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :phone1
      t.string :phone2
      t.text :address
      t.string :customer_photo
      t.string :customer_email
      t.integer :loans_taken
      t.integer :loans_cleared
      t.integer :loans_uncleared
      t.text :customer_remarks
      t.boolean :is_active , :default => true

      t.timestamps
    end
  end
end
