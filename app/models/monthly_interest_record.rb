class MonthlyInterestRecord < ActiveRecord::Base
  attr_accessible :amount, :due_date, :monthly_interest_id, :payment_date, :user_id
  belongs_to :monthly_interest
end
