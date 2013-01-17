class Dailyinterest < ActiveRecord::Base
  attr_accessible :customer_id, :date_of_issue, :due_closing_date, 
                  :interest_per_day, :loan_amount, :tatal_paid, :total_interest, 
                  :loan_name, :payment_days

  #Fields Which are Required are validated here.
  validates_presence_of :customer_id, :date_of_issue,
                        :due_closing_date,:loan_name

  #Fields Which Should be Numerical are validated here.
  validates :interest_per_day, :loan_amount, 
            :tatal_paid, :total_interest, :payment_days,
            :numericality => { :only_integer => true }  

  #The Name of the Lone must be unique is validated here.
  validates :loan_name, :uniqueness => true          
  
  #Relations has been mapped here 
  has_many :daily_interest_loan_records
  has_many :di_transactions
  belongs_to :customer


end
