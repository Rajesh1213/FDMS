class AddDocFieldsToMonthlyFinance < ActiveRecord::Migration
  def change
  	add_column :monthly_finances, :security_doc_1, :string
  	add_column :monthly_finances, :security_doc_2, :string
  	add_column :monthly_finances, :security_doc_3, :string
  	add_column :monthly_finances, :security_doc_4, :string
  end
end
