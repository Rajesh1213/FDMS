class DailyinterestsController < ApplicationController
  before_filter :authenticate_user! 
  #load_and_authorize_resource
  # GET /dailyinterests
  # GET /dailyinterests.json
  def index
      redirect_to :controller =>"dailyinterests", :action =>"dashboard"
    @dailyinterests = Dailyinterest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dailyinterests }
    end
  end

  # GET /dailyinterests/1
  # GET /dailyinterests/1.json
  def show
    @dailyinterest = Dailyinterest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dailyinterest }
    end
  end

  def search_customer
    @customer = Customer.find_by_account_number(params[:query])
    render :update do |page|
      page.replace_html 'account_id' , :partial => 'account_id'
      page.replace_html 'account_info', :partial => 'monthly_finances/div_account_info'
    end
  end

  # GET /dailyinterests/new
  # GET /dailyinterests/new.json
  def new
    @dailyinterest = Dailyinterest.new
    @customer = Customer.find(params[:id]) if params[:id]

    @dailyinterest_name = Dailyinterest.last
    if @dailyinterest_name.nil?
      @dailyinterest_name = "DI-loan1"
    else
      @dailyinterest_name = @dailyinterest_name.loan_name.next
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dailyinterest }
    end
  end

  # GET /dailyinterests/1/edit
  def edit
    @dailyinterest = Dailyinterest.find(params[:id])
  end

  # POST /dailyinterests
  # POST /dailyinterests.json
  def create
    #render :text => params.inspect;return
    
    @dailyinterest = Dailyinterest.new(params[:dailyinterest])
    @customer_id = params[:dailyinterest][:customer_id]
    @customer = Customer.find_by_account_number(@customer_id)
    @dailyinterest.customer_id = @customer.id

    respond_to do |format|
      if @dailyinterest.save

        if @customer.loans_taken == nil
          @customer.update_attributes(:loans_taken => '1')
        else
          loans_taken = @customer.loans_taken + 1
          @customer.update_attributes(:loans_taken => loans_taken)
        end
        
        due_day =  @dailyinterest.date_of_issue.to_datetime

        @dailyinterest.payment_days.times do 
          @di_record = DailyInterestLoanRecord.new 
          @di_record.dailyinterest_id = @dailyinterest.id  
          @di_record.amount = params[:dailyinterest][:interest_per_day]
          @di_record.due_date = due_day
          @di_record.save   
          due_day = due_day + 1.day
        end

        update_di_transaction(@dailyinterest)
        UserMailer.welcome_daily_interest(@customer).deliver
        format.html { redirect_to :controller => "customers", :action => "show", :id => @customer.id, notice: 'Dailyinterest was successfully created.' }
        format.json { render json: @dailyinterest, status: :created, location: @dailyinterest }
      else
        format.html { render action: "new" }
        format.json { render json: @dailyinterest.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_di_transaction(id)
    new_transaction = DiTransaction.create do |t|
    t.tran_date = Date.today.to_date
    t.particulars = " <- By Credit Isuue Monthly Finance to customer "
    t.debit = @dailyinterest.total_interest
    t.opening_balance = DiTransaction.last.closing_balance 
    t.closing_balance = t.opening_balance.to_i - t.debit.to_i
    t.balance = t.closing_balance
    t.dailyinterest_id = @dailyinterest.id
    end 
  end


  # PUT /dailyinterests/1
  # PUT /dailyinterests/1.json
  def update
    @dailyinterest = Dailyinterest.find(params[:id])

    respond_to do |format|
      if @dailyinterest.update_attributes(params[:dailyinterest])
        format.html { redirect_to @dailyinterest, notice: 'Dailyinterest was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dailyinterest.errors, status: :unprocessable_entity }
      end
    end
  end

  def track_record
    @difinance = Dailyinterest.find(params[:id])
    @track_record = @difinance.daily_interest_loan_records
    @customer = @difinance.customer
    @amount = @difinance.interest_per_day
  end

  def make_payment
    @track_record =  DailyInterestLoanRecord.find(params[:id])
    @amount = @track_record.amount
    @id = params[:sno]
  end

  def confirm_payment
    @track_record = DailyInterestLoanRecord.find(params[:id])
    @track_record.update_attributes(:payment_date => Date.today.to_datetime)
    @track_record.user_id = current_user.id
    @track_record.save
    
    @id = params[:sno]
    amount = @track_record.amount
    @difinance = Dailyinterest.find(@track_record.dailyinterest.id)
    total = @difinance.tatal_paid.to_i + amount.to_i
    @difinance.update_attributes(:tatal_paid => total) 
    @amount = amount

    update_payback_transaction(@track_record)

  end

   def update_payback_transaction(id)
    @track_record = DailyInterestLoanRecord.find(id)
    new_transaction = DiTransaction.create do |t|
    t.tran_date = Date.today.to_datetime
    t.particulars = " -> By debit Payback Monthly Installment "
    t.credit = @track_record.amount
    t.opening_balance = DiTransaction.last.closing_balance 
    t.closing_balance = t.opening_balance.to_i + t.credit.to_i
    t.balance = t.closing_balance
    t.dailyinterest_id = @track_record.dailyinterest.id
    end 
  end

  # DELETE /dailyinterests/1
  # DELETE /dailyinterests/1.json
  def destroy
    @dailyinterest = Dailyinterest.find(params[:id])
    @dailyinterest.destroy

    respond_to do |format|
      format.html { redirect_to dailyinterests_url }
      format.json { head :no_content }
    end
  end
end
