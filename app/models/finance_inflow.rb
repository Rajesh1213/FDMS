class FinanceInflow < ActiveRecord::Base
  attr_accessible :amount, :debited_from, :income_type
  
  validates_presence_of :amount, :debited_from, :income_type
  validates :amount, :numericality => { :only_integer => true }  
  
end
