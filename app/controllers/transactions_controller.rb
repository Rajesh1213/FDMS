class TransactionsController < ApplicationController

  def download_transaction_pdf
    if params.include? "start_date" and params.include? "end_date" and !params["start_date"].blank? and !params["end_date"].blank? 
      start_date = Time.parse(params[:start_date]).strftime('%y-%m-%d 00:00:00')
      end_date = Time.parse(params[:end_date]).strftime('%y-%m-%d 23:59:00')

      @transactions = Transaction.where(:tran_date => start_date..end_date).paginate(:page => params[:page], :per_page => 15)
    else
      @transactions = Transaction.paginate(:page => params[:page], :per_page => 15)
    end

    unless Transaction.last.nil?
      @total = Transaction.last.closing_balance
    end

    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "Monthly Finance Transactions-#{Time.now}"
      end
    end
  end

  # GET /transactions
  # GET /transactions.json
  def index
    if params.include? "start_date" and params.include? "end_date" and !params["start_date"][0].blank? and !params["end_date"][0].blank? 
      start_date = Time.parse(params[:start_date][0]).strftime('%y-%m-%d 00:00:00')
      end_date = Time.parse(params[:end_date][0]).strftime('%y-%m-%d 23:59:00')

      @transactions = Transaction.where(:tran_date => start_date..end_date).paginate(:page => params[:page], :per_page => 15)
    else
      @transactions = Transaction.paginate(:page => params[:page], :per_page => 15)
    end


    unless Transaction.last.nil?
      @total = Transaction.last.closing_balance
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transactions }
    end
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
    @transaction = Transaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transaction }
    end
  end

  # GET /transactions/new
  # GET /transactions/new.json
  def new
    @transaction = Transaction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transaction }
    end
  end

  # GET /transactions/1/edit
  def edit
    @transaction = Transaction.find(params[:id])
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(params[:transaction])

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render json: @transaction, status: :created, location: @transaction }
      else
        format.html { render action: "new" }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /transactions/1
  # PUT /transactions/1.json
  def update
    @transaction = Transaction.find(params[:id])

    respond_to do |format|
      if @transaction.update_attributes(params[:transaction])
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to transactions_url }
      format.json { head :no_content }
    end
  end
end
