class AddFieldsToMFInvestment < ActiveRecord::Migration
  def change
  	add_column :monthly_f_investments, :invested_in, :string
  end
end
