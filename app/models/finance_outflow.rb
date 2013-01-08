class FinanceOutflow < ActiveRecord::Base
  attr_accessible :amount, :credited_from, :income_type

  validates_presence_of :amount, :credited_from, :income_type
  validates :amount, :numericality => { :only_integer => true } 
end
