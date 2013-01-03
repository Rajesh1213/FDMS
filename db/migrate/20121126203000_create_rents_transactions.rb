class CreateRentsTransactions < ActiveRecord::Migration
  def change
    create_table :rents_transactions do |t|
      t.string :rent_amount
      t.datetime :due_date
      t.datetime :paid_date
      t.string :month
      t.datetime :next_due_date
      t.string :paid_amount
      t.string :bal_amount
      t.string :collected_by
      t.integer :rent_id

      t.timestamps
    end
  end
end
