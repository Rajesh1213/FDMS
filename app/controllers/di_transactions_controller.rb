class DiTransactionsController < ApplicationController
  before_filter :authenticate_user! 
  
  def download_transaction_pdf
    if params.include? "start_date" and params.include? "end_date" and !params["start_date"][0].blank? and !params["end_date"][0].blank? 
      start_date = Time.parse(params[:start_date]).strftime('%y-%m-%d 00:00:00')
      end_date = Time.parse(params[:end_date]).strftime('%y-%m-%d 23:59:00')

      @di_transactions = DiTransaction.where(:tran_date => start_date..end_date).paginate(:page => params[:page], :per_page => 15)
    else
      @di_transactions = DiTransaction.paginate(:page => params[:page], :per_page => 15)
    end

    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "Daily Interest Transactions-#{Time.now}"
      end
    end
  end

  # GET /di_transactions
  # GET /di_transactions.json
  def index
    if params.include? "start_date" and params.include? "end_date" and !params["start_date"][0].blank? and !params["end_date"][0].blank? 
      start_date = Time.parse(params[:start_date][0]).strftime('%y-%m-%d 00:00:00')
      end_date = Time.parse(params[:end_date][0]).strftime('%y-%m-%d 23:59:00')

      @di_transactions = DiTransaction.where(:tran_date => start_date..end_date).paginate(:page => params[:page], :per_page => 15)
    else
      @di_transactions = DiTransaction.paginate(:page => params[:page], :per_page => 15)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @di_transactions }
    end
  end

  # GET /di_transactions/1
  # GET /di_transactions/1.json
  def show
    @di_transaction = DiTransaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @di_transaction }
    end
  end

  # GET /di_transactions/new
  # GET /di_transactions/new.json
  def new
    @di_transaction = DiTransaction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @di_transaction }
    end
  end

  # GET /di_transactions/1/edit
  def edit
    @di_transaction = DiTransaction.find(params[:id])
  end

  # POST /di_transactions
  # POST /di_transactions.json
  def create
    @di_transaction = DiTransaction.new(params[:di_transaction])

    respond_to do |format|
      if @di_transaction.save
        format.html { redirect_to @di_transaction, notice: 'Di transaction was successfully created.' }
        format.json { render json: @di_transaction, status: :created, location: @di_transaction }
      else
        format.html { render action: "new" }
        format.json { render json: @di_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /di_transactions/1
  # PUT /di_transactions/1.json
  def update
    @di_transaction = DiTransaction.find(params[:id])

    respond_to do |format|
      if @di_transaction.update_attributes(params[:di_transaction])
        format.html { redirect_to @di_transaction, notice: 'Di transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @di_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /di_transactions/1
  # DELETE /di_transactions/1.json
  def destroy
    @di_transaction = DiTransaction.find(params[:id])
    @di_transaction.destroy

    respond_to do |format|
      format.html { redirect_to di_transactions_url }
      format.json { head :no_content }
    end
  end
end
