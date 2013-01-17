class MonthlyFinancesController < ApplicationController
  before_filter :authenticate_user! 
  #load_and_authorize_resource
  # GET /monthly_finances
  # GET /monthly_finances.json
  def index
    @monthly_finances = MonthlyFinance.all
    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render json: @monthly_finances }
    # end
  end

  def dashboard
  end

  def list
    @content_list = MonthlyFinance.find(:all, :conditions => "loan_status = 'active' ")
  end

  # GET /monthly_finances/1
  # GET /monthly_finances/1.json
  def show
    @monthly_finance = MonthlyFinance.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @monthly_finance }
    end
  end

  # GET /monthly_finances/new
  # GET /monthly_finances/new.json
  def new
    @monthly_finance = MonthlyFinance.new
    @customer = Customer.find(params[:id]) if params[:id]
    @partners = Partner.all
    @transaction = MonthlyFInvestment.find(:all, :conditions => "invested_in = 'monthly_finance' and is_active = '1' ").map(&:investment_amount).inject{|sum,x| sum.to_i + x.to_i} 

    @mfinance_name = MonthlyFinance.last
    if @mfinance_name.nil?
      @mfinance_name = "MF-loan1"
    else
      @mfinance_name = @mfinance_name.loan_name.next
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @monthly_finance }
    end
  end

  def search_customer

    @customer = Customer.find_by_account_number(params[:query])

    render :update do |page|
      page.replace_html 'account_id' , :partial => 'div_account_id'
      page.replace_html 'account_info', :partial => 'div_account_info'
    end
  end

  # GET /monthly_finances/1/edit
  def edit
    @monthly_finance = MonthlyFinance.find(params[:id])
  end

  # POST /monthly_finances
  # POST /monthly_finances.json
  def create
    #render :text => params.inspect;return
    @monthly_finance = MonthlyFinance.new(params[:monthly_finance])
    @customer_id = params[:monthly_finance][:customer_id]
    @customer = Customer.find_by_account_number(@customer_id)
    @monthly_finance.customer_id = @customer.id unless @customer.blank?
    @transaction = Transaction.last
    @customer = Customer.find(params[:id]) if params[:id]
    @partners = Partner.all

    @mfinance_name = MonthlyFinance.last
    if @mfinance_name.nil?
      @mfinance_name = "MF-loan1"
    else
      @mfinance_name = @mfinance_name.loan_name.next
    end

    respond_to do |format|
      if @monthly_finance.save
        if @customer.loans_taken == nil
          @customer.update_attributes(:loans_taken => '1')
        else
          loans_taken = @customer.loans_taken + 1
          @customer.update_attributes(:loans_taken => loans_taken)
        end

        if @customer.loans_uncleared == nil
          @customer.update_attributes(:loans_uncleared => '1')
        else
          loans_uncleared = @customer.loans_uncleared + 1
          @customer.update_attributes(:loans_uncleared => loans_uncleared)
        end
      @amount = (params[:monthly_finance][:main_balance]).to_i / (params[:monthly_finance][:payment_months]).to_i
      month =  Date.today.to_date + 1.month
      @monthly_finance.payment_months.times do
        @mfrecord = MonthlyFinanceRecord.new 
        @mfrecord.monthly_finance_id = @monthly_finance.id  
        @mfrecord.due_date = month
        @mfrecord.amount = @amount
        @mfrecord.save  
        month = month + 1.month
      end
        
        #update transaction table here
        update_transaction(@monthly_finance)
        UserMailer.welcome_monthly_finance(@customer).deliver
        flash[:notice] = 'Monthly finance was successfully created.' 
        format.html { redirect_to :controller => "customers", :action => "show", :id => @customer.id}
        format.json { render json: @monthly_finance, status: :created, location: @monthly_finance }
      else
        format.html { render action: "new" }
        format.json { render json: @monthly_finance.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_transaction(id)
    new_transaction = Transaction.create do |t|
    t.tran_date = Date.today.to_date
    t.particulars = " <- By Debit Isuue Monthly Finance to customer "
    t.debit = params[:monthly_finance][:amount_recieved]
    t.opening_balance = Transaction.last.closing_balance 
    t.closing_balance = t.opening_balance.to_i - t.debit.to_i
    t.balance = t.closing_balance
    t.monthly_finance_id = @monthly_finance.id
    end 
  end

  # PUT /monthly_finances/1
  # PUT /monthly_finances/1.json
  def update
    @monthly_finance = MonthlyFinance.find(params[:id])
    respond_to do |format|
      if @monthly_finance.update_attributes(params[:monthly_finance])
        format.html { redirect_to @monthly_finance, notice: 'Monthly finance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @monthly_finance.errors, status: :unprocessable_entity }
      end
    end
  end

  def download_track_record_pdf
    @mfinance = MonthlyFinance.find(params[:id])
    @track_record = @mfinance.monthly_finance_records
    @customer = @mfinance.customer
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "Customer Loan Details"
      end
    end
  end

  def track_record
    @mfinance = MonthlyFinance.find(params[:id])
    @track_record = @mfinance.monthly_finance_records
    @customer = @mfinance.customer
  end

  def make_payment
    @track_record =  MonthlyFinanceRecord.find(params[:id])
    @id = params[:sno]
  end

  def confirm_payment
    #render :text => params.inspect;return
    @track_record = MonthlyFinanceRecord.find(params[:id])
    if params[:paid_amount].nil? or params[:paid_amount].blank? or params[:payment_date].nil? or params[:payment_date].blank?
      @amount = "Enter Amount" if params[:paid_amount].blank?
      @payment_date = "Select Payment date" if params[:payment_date].blank?
    else
      @track_record.update_attributes(:payment_date => params[:payment_date])
      @track_record.update_attributes(:paid_amount => params[:paid_amount])
      @track_record.update_attributes(:remarks => params[:customer_remarks])
      @track_record.update_attributes(:penalty => params[:penalty])
      @track_record.user_id = current_user.id
      @track_record.save

        if @track_record.save
          @id = params[:sno]
          @dfinance = MonthlyFinance.find(@track_record.monthly_finance.id)
          total = @dfinance.cleared_balance.to_i + params[:paid_amount].to_i
          @dfinance.update_attributes(:cleared_balance => total) 
          balance =  @dfinance.main_balance.to_i - @dfinance.cleared_balance.to_i
          @track_record.update_attributes(:balance_amount => balance)
          if balance == 0
            loans_cleared = @dfinance.customer.loans_cleared
            loans_uncleared = @dfinance.customer.loans_uncleared - 1
            if loans_cleared.nil? or loans_cleared.blank?
              loans_cleared = 1
            else
              loans_cleared = loans_cleared.next
            end
            @dfinance.customer.update_attributes(:loans_uncleared => loans_uncleared)
            @dfinance.customer.update_attributes(:loans_cleared => loans_cleared)
          end
          @amount = @track_record.amount.to_i
          update_payback_transaction(@track_record)
        end
      end
  end
  
  def update_payback_transaction(id)
    @track_record = MonthlyFinanceRecord.find(id)
    new_transaction = Transaction.create do |t|
    t.tran_date = params[:payment_date]
    t.particulars = " -> By credit Payback Monthly Installment "
    t.credit = params[:paid_amount]
    t.opening_balance = Transaction.last.closing_balance 
    t.closing_balance = t.opening_balance.to_i + t.credit.to_i
    t.balance = t.closing_balance
    t.monthly_finance_id = @track_record.monthly_finance.id
    end 
  end

  # DELETE /monthly_finances/1
  # DELETE /monthly_finances/1.json
  def destroy
    @monthly_finance = MonthlyFinance.find(params[:id])
    @monthly_finance.destroy

    respond_to do |format|
      format.html { redirect_to monthly_finances_url }
      format.json { head :no_content }
    end
  end
end
