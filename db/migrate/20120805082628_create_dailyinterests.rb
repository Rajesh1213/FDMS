class CreateDailyinterests < ActiveRecord::Migration
  def change
    create_table :dailyinterests do |t|
      t.integer :user_id
      t.integer :customer_id
      t.string :loan_amount
      t.integer :interest_per_day
      t.datetime :date_of_issue
      t.datetime :due_closing_date
      t.string :total_interest
      t.string :tatal_paid

      t.timestamps
    end
  end
end
