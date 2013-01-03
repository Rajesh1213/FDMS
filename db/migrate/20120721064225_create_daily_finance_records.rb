class CreateDailyFinanceRecords < ActiveRecord::Migration
  def change
    create_table :daily_finance_records do |t|
      t.integer :daily_finance_id
      t.datetime :due_date
      t.datetime :payment_date
      t.integer  :user_id

      t.timestamps
    end
  end
end
