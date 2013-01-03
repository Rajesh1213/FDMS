class AddLoanNameToDailyinterests < ActiveRecord::Migration
  def change
  	add_column :dailyinterests, :loan_name, :string
  	add_column :dailyinterests, :payment_days, :integer
  end
end
