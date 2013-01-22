class MiTransactionsController < ApplicationController
    
  def download_transaction_pdf
    if params.include? "start_date" and params.include? "end_date" and !params["start_date"][0].blank? and !params["end_date"][0].blank? 
      start_date = Time.parse(params[:start_date]).strftime('%y-%m-%d 00:00:00')
      end_date = Time.parse(params[:end_date]).strftime('%y-%m-%d 23:59:00')

      @mi_transactions = MiTransaction.where(:tran_date => start_date..end_date).paginate(:page => params[:page], :per_page => 15)
    else
      @mi_transactions = MiTransaction.paginate(:page => params[:page], :per_page => 15)
    end

    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "Monthly Interest Transactions-#{Time.now}"
      end
    end
  end

  # GET /mi_transactions
  # GET /mi_transactions.json
  def index
    if params.include? "start_date" and params.include? "end_date" and !params["start_date"][0].blank? and !params["end_date"][0].blank? 
      start_date = Time.parse(params[:start_date][0]).strftime('%y-%m-%d 00:00:00')
      end_date = Time.parse(params[:end_date][0]).strftime('%y-%m-%d 23:59:00')

      @mi_transactions = MiTransaction.where(:tran_date => start_date..end_date).paginate(:page => params[:page], :per_page => 15)
    else
      @mi_transactions = MiTransaction.paginate(:page => params[:page], :per_page => 15)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mi_transactions }
    end
  end

  # GET /mi_transactions/1
  # GET /mi_transactions/1.json
  def show
    @mi_transaction = MiTransaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mi_transaction }
    end
  end

  # GET /mi_transactions/new
  # GET /mi_transactions/new.json
  def new
    @mi_transaction = MiTransaction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mi_transaction }
    end
  end

  # GET /mi_transactions/1/edit
  def edit
    @mi_transaction = MiTransaction.find(params[:id])
  end

  # POST /mi_transactions
  # POST /mi_transactions.json
  def create
    @mi_transaction = MiTransaction.new(params[:mi_transaction])

    respond_to do |format|
      if @mi_transaction.save
        format.html { redirect_to @mi_transaction, notice: 'Mi transaction was successfully created.' }
        format.json { render json: @mi_transaction, status: :created, location: @mi_transaction }
      else
        format.html { render action: "new" }
        format.json { render json: @mi_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mi_transactions/1
  # PUT /mi_transactions/1.json
  def update
    @mi_transaction = MiTransaction.find(params[:id])

    respond_to do |format|
      if @mi_transaction.update_attributes(params[:mi_transaction])
        format.html { redirect_to @mi_transaction, notice: 'Mi transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mi_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mi_transactions/1
  # DELETE /mi_transactions/1.json
  def destroy
    @mi_transaction = MiTransaction.find(params[:id])
    @mi_transaction.destroy

    respond_to do |format|
      format.html { redirect_to mi_transactions_url }
      format.json { head :no_content }
    end
  end
end
