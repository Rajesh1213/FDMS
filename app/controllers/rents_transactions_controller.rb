class RentsTransactionsController < ApplicationController
  # GET /rents_transactions
  # GET /rents_transactions.json
  def index
    @rents_transactions = RentsTransaction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rents_transactions }
    end
  end

  # GET /rents_transactions/1
  # GET /rents_transactions/1.json
  def show
    @rents_transaction = RentsTransaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rents_transaction }
    end
  end

  # GET /rents_transactions/new
  # GET /rents_transactions/new.json
  def new
    @rents_transaction = RentsTransaction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rents_transaction }
    end
  end

  # GET /rents_transactions/1/edit
  def edit
    @rents_transaction = RentsTransaction.find(params[:id])
  end

  # POST /rents_transactions
  # POST /rents_transactions.json
  def create
    @rents_transaction = RentsTransaction.new(params[:rents_transaction])

    respond_to do |format|
      if @rents_transaction.save
        format.html { redirect_to @rents_transaction, notice: 'Rents transaction was successfully created.' }
        format.json { render json: @rents_transaction, status: :created, location: @rents_transaction }
      else
        format.html { render action: "new" }
        format.json { render json: @rents_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rents_transactions/1
  # PUT /rents_transactions/1.json
  def update
    @rents_transaction = RentsTransaction.find(params[:id])

    respond_to do |format|
      if @rents_transaction.update_attributes(params[:rents_transaction])
        format.html { redirect_to @rents_transaction, notice: 'Rents transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rents_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rents_transactions/1
  # DELETE /rents_transactions/1.json
  def destroy
    @rents_transaction = RentsTransaction.find(params[:id])
    @rents_transaction.destroy

    respond_to do |format|
      format.html { redirect_to rents_transactions_url }
      format.json { head :no_content }
    end
  end
end
