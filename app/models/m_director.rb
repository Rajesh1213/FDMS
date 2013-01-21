class MDirector < ActiveRecord::Base
  attr_accessible :address, :email, :first_name,
  				  :last_name, :phone1, :phone2, 
  				  :photo, :unique_id

  has_many :partners
  has_many :monthly_f_investments

  validates_presence_of :address, :email, :first_name,
  				        :last_name, :phone1
  
  validates :phone1, :phone2, 
            :numericality => { :only_integer => true } 

  mount_uploader :photo, ImageUploader

  validates :unique_id, :uniqueness => true

  def total_loans(pid)
    Rails.logger.info"=---------------------------inside total_loans helper"
    id = pid
    mf_loans = MonthlyFinance.find_all_by_partner_id(id).count
    df_loans = DailyFinance.find_all_by_partner_id(id).count

    loans_issued = mf_loans + df_loans
    return loans_issued
  end
   
end
