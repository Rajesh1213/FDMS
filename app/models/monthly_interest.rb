class MonthlyInterest < ActiveRecord::Base
  attr_accessible :customer_id, :date_of_issue, :due_closing_date, 
                  :interest_per_day, :loan_amount, :loan_name, :payment_days, 
                  :total_interest, :total_paid, :user_id

  #Fields Which are Required are validated here.
  validates_presence_of :customer_id, :date_of_issue, :due_closing_date,
                        :payment_days, :user_id

  #Fields Which Should be Numerical are validated here. 
  validates :interest_per_day, :loan_amount,:total_interest, :total_paid,
            :numericality => { :only_integer => true }  

  #The Name of the Lone must be unique is validated here.
  validates :loan_name, :uniqueness => true                            
   
  #Relations has been mapped here 
  has_many :monthly_interest_records
  has_many :mi_transactions
  belongs_to :customer
end
