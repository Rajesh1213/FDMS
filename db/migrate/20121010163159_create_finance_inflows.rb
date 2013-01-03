class CreateFinanceInflows < ActiveRecord::Migration
  def change
    create_table :finance_inflows do |t|
      t.string :amount
      t.string :debited_from
      t.string :income_type

      t.timestamps
    end
  end
end
