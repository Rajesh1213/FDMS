class CreateMonthlyInterests < ActiveRecord::Migration
  def change
    create_table :monthly_interests do |t|
      t.integer :user_id
      t.integer :customer_id
      t.string :loan_amount
      t.integer :interest_per_day
      t.datetime :date_of_issue
      t.datetime :due_closing_date
      t.string :total_interest
      t.string :total_paid
      t.string :loan_name
      t.integer :payment_days

      t.timestamps
    end
  end
end
