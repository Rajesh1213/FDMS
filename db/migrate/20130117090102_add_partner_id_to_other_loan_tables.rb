class AddPartnerIdToOtherLoanTables < ActiveRecord::Migration
  def change
  	add_column :daily_finances, :partner_id, :integer
  	add_column :dailyinterests, :partner_id, :integer
  	add_column :monthly_interests, :partner_id, :integer
  end
end
