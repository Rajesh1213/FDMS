class HomeController < ApplicationController
  before_filter :authenticate_user!
  
  def index
  end

  def settings
  end

  def transactions
  end

  def index_pdf
	render :pdf => "my_pdf", :template => '/home/index_pdf',:footer => {:center =>"Center", :left => "Left", :right => "Right"}
  end
  
end
