class RentsController < ApplicationController
  before_filter :authenticate_user! 
  # load_and_authorize_resource
  # GET /rents
  # GET /rents.json
  def index
    @rents = Rent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rents }
    end
  end

  def dashboard
  end
  
  def home
  end

  def view_rents
  end

  def full_details
    @rent = Rent.find(params[:id])
    @rent_details = @rent.rents_transactions
  end

  def search_properties
    @rents = Rent.find(:all,  :conditions => " (address like '%#{params[:query]}%' or tenant_name like '%#{params[:query]}%') ")

    render :update do |page|
          page.replace_html 'rents' , :partial => 'result_rents'
    end
  end

  # GET /rents/1
  # GET /rents/1.json
  def show
    @rent = Rent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rent }
    end
  end

  # GET /rents/new
  # GET /rents/new.json
  def new
    @rent = Rent.new
    @properties = AddProperty.find(:all, :conditions =>" is_rented = 0 ");

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rent }
    end
  end

  # GET /rents/1/edit
  def edit
    @rent = Rent.find(params[:id])
  end

  # POST /rents
  # POST /rents.json
  def create
    # render :text => params.inspect;return
    @rent = Rent.new(params[:rent])
    @properties = AddProperty.find(:all, :conditions => " is_rented = 0 ");

    respond_to do |format|
      if @rent.save
        property = @rent.add_property
        property.is_rented = true
        property.save
        
        due_date = @rent.signed_contract_date
        period = @rent.contract_period.to_i
        period.times do 
          rt = RentsTransaction.new
          rt.rent_id = @rent.id
          rt.rent_amount = @rent.rent_per_month
          rt.due_date = due_date
          rt.next_due_date = due_date + 1.month
          rt.bal_amount = @rent.rent_per_month
          rt.save
          due_date = due_date + 1.month
        end

        format.html { redirect_to @rent, notice: 'Rent was successfully created.' }
        format.json { render json: @rent, status: :created, location: @rent }
      else
        format.html { render action: "new" }
        format.json { render json: @rent.errors, status: :unprocessable_entity }
      end

    end
  end

  # PUT /rents/1
  # PUT /rents/1.json
  def update
    @rent = Rent.find(params[:id])

    respond_to do |format|
      if @rent.update_attributes(params[:rent])
        format.html { redirect_to @rent, notice: 'Rent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rent.errors, status: :unprocessable_entity }
      end
    end
  end

  def make_payment
    @track_record = RentsTransaction.find(params[:id])
  end

  def confirm_payment
    @track_record = RentsTransaction.find(params[:id])
    @amount = params[:paid_amount]
    @paid_amount = @track_record.paid_amount.to_i + @amount.to_i
    @remaning_amount = @track_record.bal_amount.to_i - @amount.to_i 
    @track_record.paid_amount = @paid_amount
    @track_record.paid_date = params[:paid_date]
    @track_record.collected_by = params[:collected_by]
    @track_record.bal_amount = @remaning_amount
    @track_record.save 
  end


  def extend_rent_contract
    @rent = Rent.find(params[:id])
    if request.post?
      if params[:c_period].nil? or params[:c_period].blank?
        @validate = "Please enter Contract Period in Months"
        flash[:notice] =  'Error :Please Enter contract Period in Months'
        redirect_to :action => "extend_rent_contract", :id => params[:id]
      else
        due_date = params[:e_c_signed_date].to_datetime
        @rent = Rent.find(params[:id])
        period = params[:c_period].to_i 
        period.times do
          rt = RentsTransaction.new
          rt.rent_id = @rent.id
          if params[:new_rent].blank?
            rt.rent_amount = @rent.rent_per_month
            rt.bal_amount = @rent.rent_per_month
          else
            rt.rent_amount = params[:new_rent]
            rt.bal_amount = params[:new_rent]
          end
          rt.due_date = due_date
          rt.next_due_date = due_date + 1.month
          
          rt.save
          due_date = due_date + 1.month
        end
        redirect_to :action => "full_details", :id => params[:id]
      end
    end
  end
  
  # DELETE /rents/1
  # DELETE /rents/1.json
  def destroy
    @rent = Rent.find(params[:id])
    @rent.destroy

    respond_to do |format|
      format.html { redirect_to rents_url }
      format.json { head :no_content }
    end
  end
end