class MonthlyFInvestment < ActiveRecord::Base
  attr_accessible :investment_amount, :is_active, :is_deleted, :m_director_id, :partner_id, 
  				  :invested_in

  belongs_to :m_director
  belongs_to :partner

  has_many :transactions
  has_many :mi_transactions
  has_many :df_transactions
  has_many :di_transactions
  
  validates_presence_of :investment_amount, 
  					    :m_director_id, 
  					    :partner_id, 
  					    :invested_in

 	
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
