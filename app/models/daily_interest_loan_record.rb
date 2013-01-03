class DailyInterestLoanRecord < ActiveRecord::Base
  attr_accessible :amount, :dailyinterest_id, :due_date, :payment_date, :user_id

  belongs_to :dailyinterest
end
