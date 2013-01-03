class DfTransactionsController < ApplicationController
  before_filter :authenticate_user! 
  # GET /df_transactions
  # GET /df_transactions.json
  def index
    @df_transactions = DfTransaction.all

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
