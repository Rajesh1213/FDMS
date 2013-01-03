class CreateMonthlyInterestRecords < ActiveRecord::Migration
  def change
    create_table :monthly_interest_records do |t|
      t.integer :monthly_interest_id
      t.string :amount
      t.datetime :due_date
      t.datetime :payment_date
      t.integer :user_id

      t.timestamps
    end
  end
end
