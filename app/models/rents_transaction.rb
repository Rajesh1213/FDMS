class RentsTransaction < ActiveRecord::Base
  attr_accessible :bal_amount, :collected_by, :due_date, :month, :next_due_date, 
                  :paid_amount, :paid_date, :rent_amount, :rent_id

  #Fields Which are Required are validated here.

  # validates_presence_of :collected_by, :due_date, :month, :next_due_date, 
  #                       :paid_date, :rent_id

  #Fields Which Should be Numerical are validated here.
  # validates :bal_amount, :paid_amount, :rent_amount,
  #           :numericality => { :only_integer => true }  

  #Relations has been mapped here 
  belongs_to :rent
end
