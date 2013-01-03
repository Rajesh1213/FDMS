class DailyFinancesController < ApplicationController
  before_filter :authenticate_user! 
  #load_and_authorize_resource
  # GET /daily_finances
  # GET /daily_finances.json
  def index

    @daily_finances = DailyFinance.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @daily_finances }
    end
  end
  
  def dashboard
  end

  # GET /daily_finances/1
  # GET /daily_finances/1.json
  def show
    @daily_finance = DailyFinance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @daily_finance }
    end
  end

  def search_customer
    @customer = Customer.find_by_account_number(params[:query])
    render :update do |page|
      page.replace_html 'account_id' , :partial => 'account_id'
      page.replace_html 'account_info', :partial => 'monthly_finances/div_account_info'
    end
  end

  # GET /daily_finances/new
  # GET /daily_finances/new.json
  def new
    @daily_finance = DailyFinance.new
    @customer = Customer.find(params[:id]) if params[:id]

    @dfinance_name = DailyFinance.last
    if @dfinance_name.nil?
      @dfinance_name = "DF-1"
    else
      @dfinance_name = @dfinance_name.loan_name.next
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @daily_finance }
    end
  end

  # GET /daily_finances/1/edit
  def edit
    @daily_finance = DailyFinance.find(params[:id])
  end

  # POST /daily_finances
  # POST /daily_finances.json
  def create
    #render :text => params.inspect;return
    @daily_finance = DailyFinance.new(params[:daily_finance])
    @customer_id = params[:daily_finance][:customer_id]
    @customer = Customer.find_by_account_number(@customer_id)
    @daily_finance.customer_id = @customer.id

    respond_to do |format|
      if @daily_finance.save
        
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
        
          @amount = (params[:daily_finance][:main_balance]).to_i / (params[:daily_finance][:payment_days]).to_i
          due_day =  @daily_finance.date_of_issue.to_datetime
          @daily_finance.payment_days.times do 
            @dfrecord = DailyFinanceRecord.new 
            @dfrecord.daily_finance_id = @daily_finance.id  
            @dfrecord.due_date = @daily_finance.due_date
            @dfrecord.amount = @amount
            @dfrecord.due_date = due_day
            @dfrecord.save   
            due_day = due_day + 1.day
          end

        update_di_transaction(@daily_finance)
        UserMailer.welcome_daily_finance(@customer).deliver
        flash[:notice] = 'Daily finance was successfully created.'
        format.html { redirect_to :controller => "customers", :action => "show", :id => @customer.id}
        format.json { render json: @daily_finance, status: :created, location: @daily_finance }
      else
        format.html { render action: "new" }
        format.json { render json: @daily_finance.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_di_transaction(id)
    new_transaction = DfTransaction.create do |t|
    t.tran_date = Date.today.to_date
    t.particulars = " <- By Credit Isuue Monthly Finance to customer "
    t.debit = @daily_finance.amount_recieved
    t.opening_balance = DfTransaction.last.closing_balance 
    t.closing_balance = t.opening_balance.to_i - t.debit.to_i
    t.balance = t.closing_balance
    t.daily_finance_id = @daily_finance.id
    end 
  end

  def create_loan_record
     # attr_accessible :cash_recieved_by, :daily_finance_id, :due_date, :payment_date
    
  end

  def track_record
    @dfinance = DailyFinance.find(params[:id])
    @track_record = @dfinance.daily_finance_records
    @customer = @dfinance.customer
    @amount = (@dfinance.loan_amount.to_i / @dfinance.payment_days.to_i )
  end

  def make_payment
    @track_record =  DailyFinanceRecord.find(params[:id])
    @amount = ( @track_record.daily_finance.loan_amount.to_i / @track_record.daily_finance.payment_days.to_i )
    @id = params[:sno]
  end

  def confirm_payment
    @track_record = DailyFinanceRecord.find(params[:id])
    @amount = ( @track_record.daily_finance.loan_amount.to_i / @track_record.daily_finance.payment_days.to_i )
    if params[:paid_amount].nil? or params[:paid_amount].blank? or params[:payment_date].nil? or params[:payment_date].blank?
      @amount_validate = "Enter Amount" if params[:paid_amount].blank?
      @payment_date = "Select Payment date" if params[:payment_date].blank?
    else
      @track_record.update_attributes(:payment_date => params[:payment_date].to_datetime)
      @track_record.update_attributes(:paid_amount => params[:paid_amount])
      @track_record.update_attributes(:remarks => params[:customer_remarks])
      @track_record.update_attributes(:penalty => params[:penalty])
      @track_record.user_id = current_user.id
      @track_record.save
      
      @id = params[:sno]
      amount = ( @track_record.daily_finance.loan_amount.to_i / @track_record.daily_finance.payment_days.to_i )
      @dfinance = DailyFinance.find(@track_record.daily_finance.id)
      total = @dfinance.cleared_balance.to_i + params[:paid_amount].to_i
      @dfinance.update_attributes(:cleared_balance => total) 
      @amount = amount
      balance =  @dfinance.main_balance.to_i - @dfinance.cleared_balance.to_i
      @track_record.update_attributes(:balance_amount => balance)

      update_payback_transaction(@track_record)

    end
  end

  def update_payback_transaction(id)
    @track_record = DailyFinanceRecord.find(id)
    new_transaction = DfTransaction.create do |t|
    t.tran_date = params[:payment_date]
    t.particulars = " -> By debit Payback Monthly Installment "
    t.credit = params[:paid_amount]
    t.opening_balance = DfTransaction.last.closing_balance 
    t.closing_balance = t.opening_balance.to_i + t.credit.to_i
    t.balance = t.closing_balance
    t.daily_finance_id = @track_record.daily_finance.id
    end 
  end

  # PUT /daily_finances/1
  # PUT /daily_finances/1.json
  def update
    @daily_finance = DailyFinance.find(params[:id])

    respond_to do |format|
      if @daily_finance.update_attributes(params[:daily_finance])
        format.html { redirect_to @daily_finance, notice: 'Daily finance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @daily_finance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_finances/1
  # DELETE /daily_finances/1.json
  def destroy
    @daily_finance = DailyFinance.find(params[:id])
    @daily_finance.destroy

    respond_to do |format|
      format.html { redirect_to daily_finances_url }
      format.json { head :no_content }
    end
  end

  

end
