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
   
end
