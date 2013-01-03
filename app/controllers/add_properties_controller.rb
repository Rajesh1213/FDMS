class AddPropertiesController < ApplicationController
  # GET /add_properties
  # GET /add_properties.json
  def index
    @add_properties = AddProperty.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @add_properties }
    end
  end

  # GET /add_properties/1
  # GET /add_properties/1.json
  def show
    @add_property = AddProperty.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @add_property }
    end
  end

  # GET /add_properties/new
  # GET /add_properties/new.json
  def new
    @add_property = AddProperty.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @add_property }
    end
  end

  # GET /add_properties/1/edit
  def edit
    @add_property = AddProperty.find(params[:id])
  end

  # POST /add_properties
  # POST /add_properties.json
  def create
    @add_property = AddProperty.new(params[:add_property])

    respond_to do |format|
      if @add_property.save
        format.html { redirect_to @add_property, notice: 'Add property was successfully created.' }
        format.json { render json: @add_property, status: :created, location: @add_property }
      else
        format.html { render action: "new" }
        format.json { render json: @add_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /add_properties/1
  # PUT /add_properties/1.json
  def update
    @add_property = AddProperty.find(params[:id])

    respond_to do |format|
      if @add_property.update_attributes(params[:add_property])
        format.html { redirect_to @add_property, notice: 'Add property was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @add_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /add_properties/1
  # DELETE /add_properties/1.json
  def destroy
    @add_property = AddProperty.find(params[:id])
    @add_property.destroy

    respond_to do |format|
      format.html { redirect_to add_properties_url }
      format.json { head :no_content }
    end
  end
end
