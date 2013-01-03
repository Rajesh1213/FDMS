class MonthlyInterestsController < ApplicationController
  before_filter :authenticate_user! 
  #load_and_authorize_resource
  # GET /monthly_interests
  # GET /monthly_interests.json
  def index
    @monthly_interests = MonthlyInterest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @monthly_interests }
    end
  end

  def dashboard
  end

  # GET /monthly_interests/1
  # GET /monthly_interests/1.json
  def show
    @monthly_interest = MonthlyInterest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @monthly_interest }
    end
  end

  def search_customer
    @customer = Customer.find_by_account_number(params[:query])
    render :update do |page|
      page.replace_html 'account_id' , :partial => 'monthly_finances/div_account_id'
      page.replace_html 'account_info', :partial => 'monthly_finances/div_account_info'
    end
  end

  # GET /monthly_interests/new
  # GET /monthly_interests/new.json
  def new
    @monthly_interest = MonthlyInterest.new
    @customer = Customer.find(params[:id]) if params[:id]

    @monthly_interest_name = MonthlyInterest.last
    if @monthly_interest_name.nil?
      @monthly_interest_name = "MI-loan1"
    else
      @monthly_interest_name = @monthly_interest_name.loan_name.next
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @monthly_interest }
    end
  end

  # GET /monthly_interests/1/edit
  def edit
    @monthly_interest = MonthlyInterest.find(params[:id])
  end

  # POST /monthly_interests
  # POST /monthly_interests.json
  def create
    #render :text => params.inspect;return
    @monthly_interest = MonthlyInterest.new(params[:monthly_interest])
    @customer_id = params[:monthly_interest][:customer_id]
    @customer = Customer.find_by_account_number(@customer_id)
    @monthly_interest.customer_id = @customer.id

    respond_to do |format|
      if @monthly_interest.save
      update_transaction(@monthly_interest)

        if @customer.loans_taken == nil
          @customer.update_attributes(:loans_taken => '1')
        else
          loans_taken = @customer.loans_taken + 1
          @customer.update_attributes(:loans_taken => loans_taken)
        end

         @monthly_interest.payment_days.times do 
          @di_record = MonthlyInterestRecord.new 
          @di_record.monthly_interest_id = @monthly_interest.id  
          @di_record.amount = params[:monthly_interest][:interest_per_day]
          @di_record.save   
        end
        UserMailer.welcome_monthly_interest(@customer).deliver
        flash[:notice] =  'Monthly interest was successfully created.'
        format.html { redirect_to :controller => "customers", :action => "show", :id => @customer.id} 
        format.json { render json: @monthly_interest, status: :created, location: @monthly_interest }
      else
        format.html { render action: "new" }
        format.json { render json: @monthly_interest.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_transaction(id)
    new_transaction = MiTransaction.create do |t|
    t.tran_date = Date.today.to_date
    t.particulars = " <- By Debit Isuue Monthly interest to customer "
    t.debit = params[:monthly_interest][:total_interest]
    t.opening_balance = MiTransaction.last.closing_balance 
    t.closing_balance = t.opening_balance.to_i - t.debit.to_i
    t.balance = t.closing_balance
    t.monthly_interest_id = @monthly_interest.id
    end 
  end

  # PUT /monthly_interests/1
  # PUT /monthly_interests/1.json
  def update
    @monthly_interest = MonthlyInterest.find(params[:id])

    respond_to do |format|
      if @monthly_interest.update_attributes(params[:monthly_interest])
        format.html { redirect_to @monthly_interest, notice: 'Monthly interest was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @monthly_interest.errors, status: :unprocessable_entity }
      end
    end
  end

  def track_record
    @monthly_interest = MonthlyInterest.find(params[:id])
    @track_record = @monthly_interest.monthly_interest_records
    @customer = @monthly_interest.customer
    @amount = @monthly_interest.interest_per_day
  end

  def make_payment
    @track_record =  MonthlyInterestRecord.find(params[:id])
    @amount = @track_record.amount
    @id = params[:sno]
  end 
   
  def confirm_payment
    @track_record = MonthlyInterestRecord.find(params[:id])
    @track_record.update_attributes(:payment_date => Date.today.to_datetime)
    @track_record.user_id = current_user.id
    @track_record.save
    
    @id = params[:sno]
    amount = @track_record.amount
    @mifinance = MonthlyInterest.find(@track_record.monthly_interest.id)
    total = @mifinance.total_paid.to_i + amount.to_i
    @mifinance.update_attributes(:total_paid => total) 
    @amount = amount
    update_payback_transaction(@track_record)
  end 

  def update_payback_transaction(id)
    @track_record = MonthlyInterestRecord.find(params[:id])
    #render :text => params.inspect;return
    new_transaction = MiTransaction.create do |t|
    t.tran_date = Date.today.to_datetime
    t.particulars = " -> By Debit Payback Monthly Interest Installment "
    t.credit = @track_record.amount
    t.opening_balance = MiTransaction.last.closing_balance 
    t.closing_balance = t.opening_balance.to_i + t.credit.to_i
    t.balance = t.closing_balance
    t.monthly_interest_id = @track_record.monthly_interest.id
    end 
  end

  # DELETE /monthly_interests/1
  # DELETE /monthly_interests/1.json
  def destroy
    @monthly_interest = MonthlyInterest.find(params[:id])
    @monthly_interest.destroy

    respond_to do |format|
      format.html { redirect_to monthly_interests_url }
      format.json { head :no_content }
    end
  end
end
