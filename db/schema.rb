# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121126203000) do

  create_table "add_properties", :force => true do |t|
    t.string   "area"
    t.string   "property_type"
    t.string   "house_number"
    t.text     "street_address"
    t.string   "city"
    t.integer  "pincode"
    t.string   "state"
    t.string   "country"
    t.boolean  "is_rented",      :default => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "customers", :force => true do |t|
    t.string   "account_number"
    t.string   "reference_person"
    t.integer  "director_id"
    t.integer  "partner_id"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "phone1"
    t.string   "phone2"
    t.text     "address"
    t.string   "customer_photo"
    t.string   "customer_email"
    t.integer  "loans_taken"
    t.integer  "loans_cleared"
    t.integer  "loans_uncleared"
    t.text     "customer_remarks"
    t.boolean  "is_active",        :default => true
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "image"
  end

  create_table "daily_finance_records", :force => true do |t|
    t.integer  "daily_finance_id"
    t.datetime "due_date"
    t.datetime "payment_date"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "amount"
    t.text     "remarks"
    t.string   "paid_amount"
    t.string   "balance_amount"
    t.string   "penalty"
  end

  create_table "daily_finances", :force => true do |t|
    t.integer  "customer_id"
    t.string   "loan_name"
    t.integer  "user_id"
    t.string   "loan_amount"
    t.datetime "date_of_issue"
    t.integer  "payment_days"
    t.datetime "agreement_date"
    t.datetime "due_date"
    t.integer  "interest_percent"
    t.string   "amount_recieved"
    t.string   "main_balance"
    t.string   "cleared_balance"
    t.string   "loan_status"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "security_doc_1"
    t.string   "security_doc_2"
    t.string   "security_doc_3"
    t.string   "security_doc_4"
  end

  create_table "daily_interest_loan_records", :force => true do |t|
    t.integer  "dailyinterest_id"
    t.string   "amount"
    t.datetime "due_date"
    t.datetime "payment_date"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.text     "remarks"
    t.string   "paid_amount"
    t.string   "balance_amount"
    t.string   "penalty"
  end

  create_table "dailyinterests", :force => true do |t|
    t.integer  "user_id"
    t.integer  "customer_id"
    t.string   "loan_amount"
    t.integer  "interest_per_day"
    t.datetime "date_of_issue"
    t.datetime "due_closing_date"
    t.string   "total_interest"
    t.string   "tatal_paid"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "loan_name"
    t.integer  "payment_days"
  end

  create_table "df_transactions", :force => true do |t|
    t.datetime "tran_date"
    t.string   "tran_id"
    t.string   "particulars"
    t.string   "debit",                   :default => "0"
    t.string   "credit",                  :default => "0"
    t.string   "balance",                 :default => "0"
    t.string   "opening_balance",         :default => "0"
    t.string   "closing_balance",         :default => "0"
    t.integer  "monthly_f_investment_id"
    t.integer  "daily_finance_id"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "di_transactions", :force => true do |t|
    t.datetime "tran_date"
    t.string   "tran_id"
    t.string   "particulars"
    t.string   "debit",                   :default => "0"
    t.string   "credit",                  :default => "0"
    t.string   "balance",                 :default => "0"
    t.string   "opening_balance",         :default => "0"
    t.string   "closing_balance",         :default => "0"
    t.integer  "monthly_f_investment_id"
    t.integer  "dailyinterest_id"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "finance_inflows", :force => true do |t|
    t.string   "amount"
    t.string   "debited_from"
    t.string   "income_type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "finance_outflows", :force => true do |t|
    t.string   "amount"
    t.string   "credited_from"
    t.string   "income_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "m_directors", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone1"
    t.string   "phone2"
    t.text     "address"
    t.string   "email"
    t.string   "photo"
    t.string   "unique_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mi_transactions", :force => true do |t|
    t.datetime "tran_date"
    t.string   "tran_id"
    t.string   "particulars"
    t.string   "debit",                   :default => "0"
    t.string   "credit",                  :default => "0"
    t.string   "balance",                 :default => "0"
    t.string   "opening_balance",         :default => "0"
    t.string   "closing_balance",         :default => "0"
    t.integer  "monthly_f_investment_id"
    t.integer  "monthly_interest_id"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "monthly_f_investments", :force => true do |t|
    t.integer  "m_director_id"
    t.integer  "partner_id"
    t.string   "investment_amount"
    t.boolean  "is_active",         :default => true
    t.boolean  "is_deleted",        :default => false
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "invested_in"
  end

  create_table "monthly_finance_records", :force => true do |t|
    t.integer  "monthly_finance_id"
    t.datetime "due_date"
    t.datetime "payment_date"
    t.integer  "user_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "amount"
    t.text     "remarks"
    t.string   "paid_amount"
    t.string   "balance_amount"
    t.string   "penalty"
  end

  create_table "monthly_finances", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "user_id"
    t.string   "loan_name"
    t.datetime "date_of_issue"
    t.integer  "payment_months"
    t.datetime "agreement_date"
    t.datetime "due_date"
    t.integer  "interest_percent"
    t.string   "amount_recieved"
    t.string   "main_balance"
    t.string   "cleared_balance"
    t.string   "loan_status"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "loan_amount"
    t.string   "security_doc_1"
    t.string   "security_doc_2"
    t.string   "security_doc_3"
    t.string   "security_doc_4"
    t.string   "processing_fee"
    t.string   "monthly_inst"
    t.integer  "partner_id"
  end

  create_table "monthly_interest_records", :force => true do |t|
    t.integer  "monthly_interest_id"
    t.string   "amount"
    t.datetime "due_date"
    t.datetime "payment_date"
    t.integer  "user_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.text     "remarks"
    t.string   "paid_amount"
    t.string   "balance_amount"
    t.string   "penalty"
  end

  create_table "monthly_interests", :force => true do |t|
    t.integer  "user_id"
    t.integer  "customer_id"
    t.string   "loan_amount"
    t.integer  "interest_per_day"
    t.datetime "date_of_issue"
    t.datetime "due_closing_date"
    t.string   "total_interest"
    t.string   "total_paid"
    t.string   "loan_name"
    t.integer  "payment_days"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "partners", :force => true do |t|
    t.integer  "m_director_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone1"
    t.string   "phone2"
    t.text     "address"
    t.string   "email"
    t.string   "photo"
    t.string   "unique_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "rents", :force => true do |t|
    t.integer  "user_id"
    t.string   "security_doc_1"
    t.string   "security_doc_2"
    t.string   "security_doc_3"
    t.string   "security_doc_4"
    t.datetime "signed_contract_date"
    t.string   "contract_period"
    t.datetime "contract_expiry_date"
    t.datetime "reneval_contract_date"
    t.text     "address"
    t.string   "phone"
    t.string   "mobile"
    t.text     "description"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "add_property_id"
    t.string   "tenant_name"
    t.string   "email_id"
    t.text     "previous_residing_address"
    t.text     "permanent_address"
    t.string   "rent_per_month"
    t.string   "advance_taken"
    t.string   "rent_increase_after_ced"
    t.string   "reference"
  end

  create_table "rents_transactions", :force => true do |t|
    t.string   "rent_amount"
    t.datetime "due_date"
    t.datetime "paid_date"
    t.string   "month"
    t.datetime "next_due_date"
    t.string   "paid_amount"
    t.string   "bal_amount"
    t.string   "collected_by"
    t.integer  "rent_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "transactions", :force => true do |t|
    t.datetime "tran_date"
    t.string   "tran_id"
    t.string   "particulars"
    t.string   "debit",                   :default => "0"
    t.string   "credit",                  :default => "0"
    t.string   "balance",                 :default => "0"
    t.string   "opening_balance",         :default => "0"
    t.string   "closing_balance",         :default => "0"
    t.integer  "monthly_f_investment_id"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.integer  "monthly_finance_id"
    t.integer  "daily_finance_id"
    t.integer  "monthly_interest_id"
    t.integer  "dailyinterest_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.boolean  "superadmin"
    t.boolean  "admin"
    t.boolean  "operator"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
