class PersonalFinanceController < ApplicationController
 
  def index
  	respond_to do |format|
      # format.html # index.html.erb
      render :pdf => "my_pdf", :layout => false,:template => '/personal_finance/index',:footer => {:center =>"Center", :left => "Left", :right => "Right"}
    end
  end

  def balance_sheet
   @finance_inflows = FinanceInflow.all.reverse
   @finance_outlows = FinanceOutflow.all.reverse
  end

end
