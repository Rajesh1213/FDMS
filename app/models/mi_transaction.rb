class MiTransaction < ActiveRecord::Base
  attr_accessible :balance, :closing_balance, :credit, :debit, 
                  :monthly_f_investment_id, :monthly_interest_id, 
                  :opening_balance, :particulars, :tran_date, :tran_id

  belongs_to :monthly_interest
  belongs_to :monthly_f_investment
end
