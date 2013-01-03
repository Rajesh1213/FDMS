class CustomersController < ApplicationController  
  before_filter :authenticate_user! 
  load_and_authorize_resource

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @customers }
    end
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    @customer = Customer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @customer }
    end
  end

  # GET /customers/new
  # GET /customers/new.json
  def new
    @customer = Customer.new
    unless Customer.last.nil?
      @account_number = Customer.last.account_number.next
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @customer }
    end
  end

  # GET /customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(params[:customer])

    respond_to do |format|
      if @customer.save
        UserMailer.welcome_customer(@customer).deliver
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render json: @customer, status: :created, location: @customer }
      else
        format.html { render action: "new" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /customers/1
  # PUT /customers/1.json
  def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def loans_taken
    @customer = Customer.find(params[:id])
    @daily_finance = @customer.daily_finances
    @monthly_finance = @customer.monthly_finances
    @dailyinterest = @customer.dailyinterests
    @monthly_interest = @customer.monthly_interests
  end

  def search_customer
    if params[:query].length >= 3
      @customers = Customer.find(:all,  :conditions => " (account_number like '%#{params[:query]}%') or (first_name  like '%#{params[:query]}%') or 
                                                       (last_name  like '%#{params[:query]}%') or (middle_name  like '%#{params[:query]}%') or
                                                       (phone1  like '%#{params[:query]}%') or (phone2  like '%#{params[:query]}%') or
                                                       (customer_email  like '%#{params[:query]}%') ")
    render :update do |page|
          page.replace_html 'customers' , :partial => 'result_customers'
    end
    end
  end

  def my_profile
    @user = User.find(current_user.id)
    @dailyinterest = DailyInterestLoanRecord.find(:all, :conditions => " payment_date = '#{ Date.today.to_date }' and user_id = '#{@user.id}' ")
    @monthly_interest = MonthlyInterestRecord.find(:all, :conditions => " payment_date = '#{ Date.today.to_date }' and user_id = '#{@user.id}' ")
    @daily_finance = DailyFinanceRecord.find(:all, :conditions => " payment_date = '#{ Date.today.to_date }' and user_id = '#{@user.id}' ")
    @monthly_finance = MonthlyFinanceRecord.find(:all, :conditions => " payment_date = '#{ Date.today.to_date }' and user_id = '#{@user.id}' ")
      @df_today = @daily_finance.map(&:amount).inject{|sum,x| sum.to_i + x.to_i} 
      @dm_today = @monthly_finance.map(&:amount).inject{|sum,x| sum.to_i + x.to_i}
      @mi_today = @monthly_interest.map(&:amount).inject{|sum,x| sum.to_i + x.to_i}
      @di_today =  @dailyinterest.map(&:amount).inject{|sum,x| sum.to_i + x.to_i} 

      @total_amount_today = @mi_today.to_i + @di_today.to_i + @df_today.to_i + @dm_today.to_i 
    
      #render :text => @daily_finance.inspect;return
  end

  def all_customers
    @customers = Customer.find(:all, :conditions => " is_active = '1' ") 
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @customers }
    end
  end


  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end



end
