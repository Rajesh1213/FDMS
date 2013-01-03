class CreateRents < ActiveRecord::Migration
  def change
    create_table :rents do |t|
      t.integer :user_id
      t.string :security_doc_1
      t.string :security_doc_2
      t.string :security_doc_3
      t.string :security_doc_4
      t.datetime :signed_contract_date
      t.string :contract_period
      t.datetime :contract_expiry_date
      t.datetime :reneval_contract_date
      t.text :address
      t.string :phone
      t.string :mobile
      t.text :description

      t.timestamps
    end
  end
end
