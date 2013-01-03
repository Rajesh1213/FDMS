class AddProperty < ActiveRecord::Base
  attr_accessible :area, :city, :house_number, :country, :pincode, 
                  :state, :street_address, :property_type, :is_rented

  validates_presence_of :area, :city, :house_number,:country,
                        :state, :street_address, 
                        :property_type
                        
  validates :pincode,:numericality => { :only_integer => true }                      

  has_one :rent
end
