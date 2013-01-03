class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.integer :m_director_id
      t.string :first_name
      t.string :last_name
      t.string :phone1
      t.string :phone2
      t.text :address
      t.string :email
      t.string :photo
      t.string :unique_id

      t.timestamps
    end
  end
end
