class AddPartnerIdToMonthlyFinance < ActiveRecord::Migration
  def change
  	add_column :monthly_finances, :partner_id, :integer
  end
end
