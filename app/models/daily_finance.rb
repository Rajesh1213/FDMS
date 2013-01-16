class DailyFinance < ActiveRecord::Base
  attr_accessible :amount_recieved, :cleared_balance, 
                  :customer_id, :date_of_issue, :due_date, :interest_percent,
                  :loan_amount, :loan_name, :loan_status, :main_balance, :payment_days

 validates_presence_of :customer_id,
                       :date_of_issue, :due_date
 
 validates :amount_recieved, :cleared_balance, :loan_amount,
           :main_balance, :payment_days, :interest_percent,
           :numericality => { :only_integer => true }                    

  belongs_to :customer
  has_many :daily_finance_records
  has_many :df_transactions
  
end