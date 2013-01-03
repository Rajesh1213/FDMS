class CreateMonthlyFInvestments < ActiveRecord::Migration
  def change
    create_table :monthly_f_investments do |t|
      t.integer :m_director_id
      t.integer :partner_id
      t.string :investment_amount
      t.boolean :is_active, :default => true
      t.boolean :is_deleted, :default => false

      t.timestamps
    end
  end
end
