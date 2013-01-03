class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.datetime :tran_date
      t.string :tran_id
      t.string :particulars
      t.string :debit, :default => 0
      t.string :credit, :default => 0 
      t.string :balance, :default => 0
      t.string :opening_balance, :default => 0
      t.string :closing_balance, :default => 0 
      t.integer :monthly_f_investment_id 

      t.timestamps
    end
  end
end
