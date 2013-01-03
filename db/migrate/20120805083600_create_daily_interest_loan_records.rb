class CreateDailyInterestLoanRecords < ActiveRecord::Migration
  def change
    create_table :daily_interest_loan_records do |t|
      t.integer :dailyinterest_id
      t.string :amount
      t.datetime :due_date
      t.datetime :payment_date
      t.integer :user_id

      t.timestamps
    end
  end
end
