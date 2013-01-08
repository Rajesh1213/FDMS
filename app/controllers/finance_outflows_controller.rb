class FinanceOutflowsController < ApplicationController
  # GET /finance_outflows
  # GET /finance_outflows.json
  def index
    @finance_outflows = FinanceOutflow.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @finance_outflows }
    end
  end

  # GET /finance_outflows/1
  # GET /finance_outflows/1.json
  def show
    @finance_outflow = FinanceOutflow.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @finance_outflow }
    end
  end

  # GET /finance_outflows/new
  # GET /finance_outflows/new.json
  def new
    @finance_outflow = FinanceOutflow.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @finance_outflow }
    end
  end

  # GET /finance_outflows/1/edit
  def edit
    @finance_outflow = FinanceOutflow.find(params[:id])
  end

  # POST /finance_outflows
  # POST /finance_outflows.json
  def create
    @finance_outflow = FinanceOutflow.new(params[:finance_outflow])

    respond_to do |format|
      if @finance_outflow.save
        format.html { redirect_to polymorphic_path([:personal_finance, :expenses]), notice: 'Finance outflow was successfully created.' }
        format.json { render json: @finance_outflow, status: :created, location: @finance_outflow }
      else
        format.html { render action: "new" }
        format.json { render json: @finance_outflow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /finance_outflows/1
  # PUT /finance_outflows/1.json
  def update
    @finance_outflow = FinanceOutflow.find(params[:id])

    respond_to do |format|
      if @finance_outflow.update_attributes(params[:finance_outflow])
        format.html { redirect_to @finance_outflow, notice: 'Finance outflow was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @finance_outflow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /finance_outflows/1
  # DELETE /finance_outflows/1.json
  def destroy
    @finance_outflow = FinanceOutflow.find(params[:id])
    @finance_outflow.destroy

    respond_to do |format|
      format.html { redirect_to finance_outflows_url }
      format.json { head :no_content }
    end
  end
end
