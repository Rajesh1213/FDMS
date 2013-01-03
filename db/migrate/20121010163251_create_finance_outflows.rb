class CreateFinanceOutflows < ActiveRecord::Migration
  def change
    create_table :finance_outflows do |t|
      t.string :amount
      t.string :credited_from
      t.string :income_type

      t.timestamps
    end
  end
end
