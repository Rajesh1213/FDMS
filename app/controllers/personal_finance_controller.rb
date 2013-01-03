class PersonalFinanceController < ApplicationController
 
  def index
  end

  def balance_sheet
   @finance_inflows = FinanceInflow.all.reverse
   @finance_outlows = FinanceOutflow.all.reverse
  end

end
