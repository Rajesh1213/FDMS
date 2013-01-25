class DfTransactionsController < ApplicationController
  before_filter :authenticate_user! 

  def download_transaction_pdf
    if params.include? "start_date" and params.include? "end_date" and !params["start_date"][0].blank? and !params["end_date"][0].blank? 
      start_date = Time.parse(params[:start_date]).strftime('%y-%m-%d 00:00:00')
      end_date = Time.parse(params[:end_date]).strftime('%y-%m-%d 23:59:00')

      @df_transactions = DfTransaction.where(:tran_date => start_date..end_date).paginate(:page => params[:page], :per_page => 15)
    else
      @df_transactions = DfTransaction.paginate(:page => params[:page], :per_page => 15)
    end

    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "Daily Finance Transactions-#{Time.now}"
      end
    end
  end

  # GET /df_transactions
  # GET /df_transactions.json
  def index
    if params.include? "start_date" and params.include? "end_date" and !params["start_date"][0].blank? and !params["end_date"][0].blank? 
      start_date = Time.parse(params[:start_date][0]).strftime('%y-%m-%d 00:00:00')
      end_date = Time.parse(params[:end_date][0]).strftime('%y-%m-%d 23:59:00')

      @df_transactions = DfTransaction.where(:tran_date => start_date..end_date).paginate(:page => params[:page], :per_page => 15)
    else
      @df_transactions = DfTransaction.paginate(:page => params[:page], :per_page => 15)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @df_transactions }
    end
  end

  # GET /df_transactions/1
  # GET /df_transactions/1.json
  def show
    @df_transaction = DfTransaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @df_transaction }
    end
  end

  # GET /df_transactions/new
  # GET /df_transactions/new.json
  def new
    @df_transaction = DfTransaction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @df_transaction }
    end
  end

  # GET /df_transactions/1/edit
  def edit
    @df_transaction = DfTransaction.find(params[:id])
  end

  # POST /df_transactions
  # POST /df_transactions.json
  def create
    @df_transaction = DfTransaction.new(params[:df_transaction])

    respond_to do |format|
      if @df_transaction.save
        format.html { redirect_to @df_transaction, notice: 'Df transaction was successfully created.' }
        format.json { render json: @df_transaction, status: :created, location: @df_transaction }
      else
        format.html { render action: "new" }
        format.json { render json: @df_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /df_transactions/1
  # PUT /df_transactions/1.json
  def update
    @df_transaction = DfTransaction.find(params[:id])

    respond_to do |format|
      if @df_transaction.update_attributes(params[:df_transaction])
        format.html { redirect_to @df_transaction, notice: 'Df transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @df_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /df_transactions/1
  # DELETE /df_transactions/1.json
  def destroy
    @df_transaction = DfTransaction.find(params[:id])
    @df_transaction.destroy

    respond_to do |format|
      format.html { redirect_to df_transactions_url }
      format.json { head :no_content }
    end
  end
end
