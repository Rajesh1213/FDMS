class MonthlyFinance < ActiveRecord::Base
  attr_accessible :agreement_date, :amount_recieved, :cleared_balance, :customer_id, :date_of_issue, :due_date, :interest_percent,
                  :loan_name, :loan_status, :main_balance, :payment_months, :user_id, :loan_amount,
  					      :security_doc_1, :security_doc_2, :security_doc_3, :security_doc_4, :processing_fee, :monthly_inst, :partner_id
   
  #Relations has been mapped here 
  belongs_to :customer
  belongs_to :partner
  has_many :monthly_finance_records
  has_many :transactions
  
  #Fields Which are Required are validated here.
  validates_presence_of :amount_recieved, :customer_id,
                        :date_of_issue, :due_date,
                        :interest_percent,:loan_name, 
                        :loan_status, :main_balance, 
                        :payment_months, :loan_amount
  
  #Fields Which Should be Numerical are validated here.
  validates :main_balance, :amount_recieved, 
            :loan_amount, :interest_percent, 
            :payment_months,:processing_fee, 
            :monthly_inst,
            :numericality => { :only_integer => true } 
  
  #The Name of the Lone must be unique is validated here.
  validates :loan_name, :uniqueness => true

  # There are 4 upload file fields, are configured here.
  mount_uploader :security_doc_1, DocumentsUploader
  mount_uploader :security_doc_2, DocumentsUploader
  mount_uploader :security_doc_3, DocumentsUploader
  mount_uploader :security_doc_4, DocumentsUploader

end


# Transactions Table Desc 
# +-------------------------+--------------+------+-----+---------+----------------+
# | Field                   | Type         | Null | Key | Default | Extra          |
# +-------------------------+--------------+------+-----+---------+----------------+
# | id                      | int(11)      | NO   | PRI | NULL    | auto_increment |
# | tran_date               | datetime     | YES  |     | NULL    |                |
# | tran_id                 | varchar(255) | YES  |     | NULL    |                |
# | particulars             | varchar(255) | YES  |     | NULL    |                |
# | debit                   | varchar(255) | YES  |     | 0       |                |
# | credit                  | varchar(255) | YES  |     | 0       |                |
# | balance                 | varchar(255) | YES  |     | 0       |                |
# | opening_balance         | varchar(255) | YES  |     | 0       |                |
# | closing_balance         | varchar(255) | YES  |     | 0       |                |
# | monthly_f_investment_id | int(11)      | YES  |     | NULL    |                |
# | created_at              | datetime     | NO   |     | NULL    |                |
# | updated_at              | datetime     | NO   |     | NULL    |                |
# +-------------------------+--------------+------+-----+---------+----------------+