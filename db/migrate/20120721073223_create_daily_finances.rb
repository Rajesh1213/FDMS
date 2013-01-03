class CreateDailyFinances < ActiveRecord::Migration
  def change
    create_table :daily_finances do |t|
      t.integer :customer_id
      t.string :loan_name
      t.integer :user_id
      t.string :loan_amount
      t.datetime :date_of_issue
      t.integer :payment_days
      t.datetime :agreement_date
      t.datetime :due_date
      t.integer :interest_percent
      t.string :amount_recieved
      t.string :main_balance
      t.string :cleared_balance
      t.string :loan_status

      t.timestamps
    end
  end
end
