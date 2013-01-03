class Partner < ActiveRecord::Base
  attr_accessible :address, :email, :first_name, :last_name,
  				  :m_director_id, :phone1, :phone2, :photo, :unique_id


  belongs_to :m_director
  has_many :partners
  has_many :monthly_f_investments
  
  validates_presence_of :address, :email, :first_name,
  				        :last_name, :phone1
  
  validates :phone1, :phone2, 
            :numericality => { :only_integer => true } 

  mount_uploader :photo, ImageUploader

  validates :unique_id, :uniqueness => true

end
