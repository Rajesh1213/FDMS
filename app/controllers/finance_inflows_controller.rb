class FinanceInflowsController < ApplicationController
  # GET /finance_inflows
  # GET /finance_inflows.json
  def index
    @finance_inflows = FinanceInflow.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @finance_inflows }
    end
  end

  # GET /finance_inflows/1
  # GET /finance_inflows/1.json
  def show
    @finance_inflow = FinanceInflow.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @finance_inflow }
    end
  end

  # GET /finance_inflows/new
  # GET /finance_inflows/new.json
  def new
    @finance_inflow = FinanceInflow.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @finance_inflow }
    end
  end

  # GET /finance_inflows/1/edit
  def edit
    @finance_inflow = FinanceInflow.find(params[:id])
  end

  # POST /finance_inflows
  # POST /finance_inflows.json
  def create
    @finance_inflow = FinanceInflow.new(params[:finance_inflow])

    respond_to do |format|
      if @finance_inflow.save
        format.html { redirect_to @finance_inflow, notice: 'Finance inflow was successfully created.' }
        format.json { render json: @finance_inflow, status: :created, location: @finance_inflow }
      else
        format.html { render action: "new" }
        format.json { render json: @finance_inflow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /finance_inflows/1
  # PUT /finance_inflows/1.json
  def update
    @finance_inflow = FinanceInflow.find(params[:id])

    respond_to do |format|
      if @finance_inflow.update_attributes(params[:finance_inflow])
        format.html { redirect_to @finance_inflow, notice: 'Finance inflow was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @finance_inflow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /finance_inflows/1
  # DELETE /finance_inflows/1.json
  def destroy
    @finance_inflow = FinanceInflow.find(params[:id])
    @finance_inflow.destroy

    respond_to do |format|
      format.html { redirect_to finance_inflows_url }
      format.json { head :no_content }
    end
  end
end
