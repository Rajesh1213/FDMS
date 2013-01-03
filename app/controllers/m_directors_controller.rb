class MDirectorsController < ApplicationController
  before_filter :authenticate_user! 
  #load_and_authorize_resource
  # GET /m_directors
  # GET /m_directors.json
  def index
    @m_directors = MDirector.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @m_directors }
    end
  end

  # GET /m_directors/1
  # GET /m_directors/1.json
  def show
    @m_director = MDirector.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @m_director }
    end
  end

  # GET /m_directors/new
  # GET /m_directors/new.json
  def new
    @m_director = MDirector.new
    @directors = MDirector.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @m_director }
    end
  end

  # GET /m_directors/1/edit
  def edit
    @m_director = MDirector.find(params[:id])
  end

  # POST /m_directors
  # POST /m_directors.json
  def create
    @m_director = MDirector.new(params[:m_director])
    
    code = rand(5**5)
    while code.to_s.length != 5
    code =rand(6**6)
    end
    @m_director.unique_id = code

    respond_to do |format|
      if @m_director.save
        format.html { redirect_to m_directors_path, notice: 'Managing Director was successfully created.' }
        format.json { render json: @m_director, status: :created, location: @m_director }
      else
        format.html { render action: "new" }
        format.json { render json: @m_director.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /m_directors/1
  # PUT /m_directors/1.json
  def update
    @m_director = MDirector.find(params[:id])

    respond_to do |format|
      if @m_director.update_attributes(params[:m_director])
        format.html { redirect_to @m_director, notice: 'M director was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @m_director.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def ajax_post

  end
 
  def partners_list
    @m_director = MDirector.find(params[:id])
    @partners = @m_director.partners
  end

  # DELETE /m_directors/1
  # DELETE /m_directors/1.json
  def destroy
    @m_director = MDirector.find(params[:id])
    @m_director.destroy

    respond_to do |format|
      format.html { redirect_to m_directors_url }
      format.json { head :no_content }
    end
  end
end
