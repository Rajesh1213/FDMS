class FinanceOutflow < ActiveRecord::Base
  attr_accessible :amount, :credited_from, :income_type
end
