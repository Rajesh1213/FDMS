class Rent < ActiveRecord::Base
  attr_accessible :address, :contract_expiry_date, :contract_period, 
  				  :description, :mobile, :phone, :reneval_contract_date,
  				  :security_doc_1, :security_doc_2, :security_doc_3, :security_doc_4, 
  				  :signed_contract_date, :user_id, :add_property_id,
  				  :tenant_name, :email_id, :previous_residing_address, 
  				  :permanent_address, :rent_per_month, :advance_taken,
  				  :rent_increase_after_ced, :reference

  
  #Fields Which are Required are validated here.
  validates_presence_of :tenant_name,:permanent_address,:previous_residing_address,:email_id,
                        :contract_expiry_date, :contract_period,:reneval_contract_date,
  				        :rent_per_month, :advance_taken,:reference
  
  #Fields Which Should be Numerical are validated here.
  validates :mobile, :phone, 
            :numericality => { :only_integer => true } 

  # validates :add_property_id, :uniqueness => true

  # There are 3 upload file fields, are configured here.
  mount_uploader :security_doc_1, DocumentsUploader
  mount_uploader :security_doc_2, DocumentsUploader
  mount_uploader :security_doc_3, DocumentsUploader
 
  #Relations has been mapped here 
  belongs_to :add_property
  has_many :rents_transactions

end