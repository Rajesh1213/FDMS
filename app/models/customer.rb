class Customer < ActiveRecord::Base
  attr_accessible :account_number, :address, :customer_email, 
                  :customer_photo, :customer_remarks, :director_id, 
                  :first_name, :is_active, :last_name, :loans_cleared,
                  :loans_taken, :loans_uncleared, :middle_name, :partner_id, 
                  :phone1, :phone2, :reference_person, :image
  
  mount_uploader :image, ImageUploader 

  validates_presence_of :account_number, :first_name, :last_name, :phone1, :address 
  validates :account_number, :uniqueness => true
  
  has_many :daily_finances
  has_many :monthly_finances
  has_many :dailyinterests
  has_many :monthly_interests

end
