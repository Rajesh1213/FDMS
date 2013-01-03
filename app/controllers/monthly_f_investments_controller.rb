class MonthlyFInvestmentsController < ApplicationController
  # GET /monthly_f_investments
  # GET /monthly_f_investments.json
  def index
    @monthly_f_investments = MonthlyFInvestment.find(:all, :conditions => "is_active = '1' ")
    @total = @monthly_f_investments.map(&:investment_amount).inject{|sum,x| sum.to_i + x.to_i} 
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @monthly_f_investments }
    end
  end

  # GET /monthly_f_investments/1
  # GET /monthly_f_investments/1.json
  def show
    @monthly_f_investment = MonthlyFInvestment.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @monthly_f_investment }
    end
  end

  # GET /monthly_f_investments/new
  # GET /monthly_f_investments/new.json
  def new
    @monthly_f_investment = MonthlyFInvestment.new
    @m_directors = MDirector.all
    @partners = Partner.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @monthly_f_investment }
    end
  end

  def update_partners
    @md = MDirector.find(params[:md])
    @partners = @md.partners
     render :update do |page|
      page.replace_html 'partners' , :partial => 'div_partners'
    end
  end

  def update_partners_details
     @partner = Partner.find(params[:pid])
     
     @current_info = MonthlyFInvestment.find(:all, :conditions => " partner_id = '#{@partner.id}' and is_active = '1' ")
     @previous_info = MonthlyFInvestment.find(:all, :conditions => " partner_id = '#{@partner.id}' and is_active = '0' ")
     
     render :update do |page|
      page.replace_html 'partners_details' , :partial => 'div_partners_details'
    end
  end

  # GET /monthly_f_investments/1/edit
  def edit
    @monthly_f_investment = MonthlyFInvestment.find(params[:id])
    @m_directors = MDirector.all
    @partners = Partner.all
  end

  # POST /monthly_f_investments
  # POST /monthly_f_investments.json
  def create
    @m_directors = MDirector.all
    @partners = Partner.all
    #render :text =>params.inspect;return
    @monthly_f_investment = MonthlyFInvestment.new(params[:monthly_f_investment])
    unless params[:m_director_id].nil? or params[:m_director_id].blank?
      @monthly_f_investment.m_director_id = params[:m_director_id][:id]
    end

    unless params[:partner_id].nil? or params[:partner_id].blank?
      @monthly_f_investment.partner_id = params[:partner_id][:id] 
    end

    unless params[:invested_in].nil?
      case params[:invested_in]
      when "Monthly Finance"
        @monthly_f_investment.invested_in = "monthly_finance"
      when "Monthly Interest"
        @monthly_f_investment.invested_in = "monthly_interest"
      when "Daily Finance"
        @monthly_f_investment.invested_in = "daily_finance"
      when "Daily Interest"
        @monthly_f_investment.invested_in = "daily_interest"
      end
    end

    respond_to do |format|
      if @monthly_f_investment.save
        if params[:invested_in] == "Monthly Finance"
          add_investment_to_transaction(@monthly_f_investment)
        elsif params[:invested_in] == "Monthly Interest"
          add_investment_to_mi_transaction(@monthly_f_investment)
        elsif params[:invested_in] == "Daily Finance"
          add_investment_to_df_transaction(@monthly_f_investment)
        elsif params[:invested_in] == "Daily Interest"
          add_investment_to_di_transaction(@monthly_f_investment) 
        end

        format.html { redirect_to :controller => "monthly_f_investments" }
        format.json { render json: @monthly_f_investment, status: :created, location: @monthly_f_investment }
      else
        format.html { render action: "new" }
        format.json { render json: @monthly_f_investment.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_investment_to_transaction(id)
    new_transaction = Transaction.create do |t|
    t.tran_date = Date.today.to_datetime
    t.particulars = " -> By Investment of #{params[:invested_in]} "
    t.credit = @monthly_f_investment.investment_amount
      unless Transaction.last.nil?
        t.opening_balance = Transaction.last.closing_balance 
        t.closing_balance = t.opening_balance.to_i + @monthly_f_investment.investment_amount.to_i
        t.balance = t.closing_balance
      else
        t.closing_balance = @monthly_f_investment.investment_amount
        t.balance = t.closing_balance
      end
    t.monthly_f_investment_id = @monthly_f_investment.id
    end 
  end

  def add_investment_to_mi_transaction(id)
    new_transaction = MiTransaction.create do |t|
    t.tran_date = Date.today.to_datetime
    t.particulars = " -> By Investment of #{params[:invested_in]} "
    t.credit = @monthly_f_investment.investment_amount
      unless MiTransaction.last.nil?
        t.opening_balance = MiTransaction.last.closing_balance 
        t.closing_balance = t.opening_balance.to_i + @monthly_f_investment.investment_amount.to_i
        t.balance = t.closing_balance
      else
        t.closing_balance = @monthly_f_investment.investment_amount
        t.balance = t.closing_balance
      end
    t.monthly_f_investment_id = @monthly_f_investment.id
    end 
  end

  def add_investment_to_df_transaction(id)
    new_transaction = DfTransaction.create do |t|
    t.tran_date = Date.today.to_datetime
    t.particulars = " -> By Investment of #{params[:invested_in]} "
    t.credit = @monthly_f_investment.investment_amount
      unless DfTransaction.last.nil?
        t.opening_balance = DfTransaction.last.closing_balance 
        t.closing_balance = t.opening_balance.to_i + @monthly_f_investment.investment_amount.to_i
        t.balance = t.closing_balance
      else
        t.closing_balance = @monthly_f_investment.investment_amount
        t.balance = t.closing_balance
      end
    t.monthly_f_investment_id = @monthly_f_investment.id
    end 
  end

  def add_investment_to_di_transaction(id)
    new_transaction = DiTransaction.create do |t|
    t.tran_date = Date.today.to_datetime
    t.particulars = " -> By Investment of #{params[:invested_in]} "
    t.credit = @monthly_f_investment.investment_amount
      unless DiTransaction.last.nil?
        t.opening_balance = DiTransaction.last.closing_balance 
        t.closing_balance = t.opening_balance.to_i + @monthly_f_investment.investment_amount.to_i
        t.balance = t.closing_balance
      else
        t.closing_balance = @monthly_f_investment.investment_amount
        t.balance = t.closing_balance
      end
    t.monthly_f_investment_id = @monthly_f_investment.id
    end 
  end

  # PUT /monthly_f_investments/1
  # PUT /monthly_f_investments/1.json
  def update
    @monthly_f_investment = MonthlyFInvestment.find(params[:id])

    respond_to do |format|
      if @monthly_f_investment.update_attributes(params[:monthly_f_investment])
        format.html { redirect_to @monthly_f_investment, notice: 'Monthly f investment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @monthly_f_investment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monthly_f_investments/1
  # DELETE /monthly_f_investments/1.json
  def destroy
    #render :text => params.inspect;return
    @monthly_f_investment = MonthlyFInvestment.find(params[:id])
    @monthly_f_investment.update_attributes(:is_active => 0)
    @monthly_f_investment.update_attributes(:is_deleted => 1)
     
    remove_from_transaction(@monthly_f_investment)
    # respond_to do |format|
    #   format.html { redirect_to monthly_f_investments_url }
    #   format.json { head :no_content }
    # end
  end

  def remove_from_transaction(id)
    @monthly_f_investment = MonthlyFInvestment.find(params[:id])
    if @monthly_f_investment.invested_in == "monthly_finance"
      new_transaction = Transaction.create do |t|
        t.tran_date = Date.today.to_datetime
        t.debit = @monthly_f_investment.investment_amount
        t.particulars = " <- By Taking Back Investment of #{@monthly_f_investment.invested_in} "
        t.monthly_f_investment_id = @monthly_f_investment.id
        t.opening_balance = Transaction.last.closing_balance 
        t.closing_balance = t.opening_balance.to_i - @monthly_f_investment.investment_amount.to_i
        t.balance = t.closing_balance
      end
    end   
    if @monthly_f_investment.invested_in == "monthly_interest"
      new_transaction = MiTransaction.create do |t|
        t.tran_date = Date.today.to_datetime
        t.debit = @monthly_f_investment.investment_amount
        t.particulars = " <- By Taking Back Investment of #{@monthly_f_investment.invested_in} "
        t.monthly_f_investment_id = @monthly_f_investment.id
        t.opening_balance = MiTransaction.last.closing_balance 
        t.closing_balance = t.opening_balance.to_i - @monthly_f_investment.investment_amount.to_i
        t.balance = t.closing_balance
      end
    end

     if @monthly_f_investment.invested_in == "daily_finance"
      new_transaction = DfTransaction.create do |t|
        t.tran_date = Date.today.to_datetime
        t.debit = @monthly_f_investment.investment_amount
        t.particulars = " <- By Taking Back Investment of #{@monthly_f_investment.invested_in} "
        t.monthly_f_investment_id = @monthly_f_investment.id
        t.opening_balance = DfTransaction.last.closing_balance 
        t.closing_balance = t.opening_balance.to_i - @monthly_f_investment.investment_amount.to_i
        t.balance = t.closing_balance
      end
    end

      if @monthly_f_investment.invested_in == "daily_interest"
      new_transaction = DiTransaction.create do |t|
        t.tran_date = Date.today.to_datetime
        t.debit = @monthly_f_investment.investment_amount
        t.particulars = " <- By Taking Back Investment of #{@monthly_f_investment.invested_in} "
        t.monthly_f_investment_id = @monthly_f_investment.id
        t.opening_balance = DiTransaction.last.closing_balance 
        t.closing_balance = t.opening_balance.to_i - @monthly_f_investment.investment_amount.to_i
        t.balance = t.closing_balance
      end
    end

    respond_to do |format|
      format.html { redirect_to monthly_f_investments_url }
      format.json { head :no_content }
    end

  end

end
