class MiTransactionsController < ApplicationController
  # GET /mi_transactions
  # GET /mi_transactions.json
  def index
    @mi_transactions = MiTransaction.all

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
