class UserMailer < ActionMailer::Base
  default from: "rajesh.b@ozoneitsolutions.com"

  def welcome_email(user)
    @user = user
    @url  = "http://fdms-ozoneit.herokuapp.com"
    mail(:to => user.email, :subject => "Welcome to Ranga's Financial ENTRPRISE ")
  end

  def welcome_customer(user)
    @user = user
    @url  = "http://fdms-ozoneit.herokuapp.com"
    mail(:to => user.customer_email, :subject => "Welcome to Ranga's Financial ENTRPRISE. ")
  end
  def welcome_monthly_finance(user)
    @user = user
    @url  = "http://fdms-ozoneit.herokuapp.com"
    mail(:to => user.customer_email, :subject => "Welcome to Ranga's Financial ENTRPRISE. ")
  end
  
  def welcome_daily_finance(user)
    @user = user
    @url  = "http://fdms-ozoneit.herokuapp.com"
    mail(:to => user.customer_email, :subject => "Welcome to Ranga's Financial ENTRPRISE. ")
  end
     
  def welcome_daily_interest(user)
    @user = user
    @url  = "http://fdms-ozoneit.herokuapp.com"
    mail(:to => user.customer_email, :subject => "Welcome to Ranga's Financial ENTRPRISE. ")
  end
  
  def welcome_monthly_interest(user)
    @user = user
    @url  = "http://fdms-ozoneit.herokuapp.com"
    mail(:to => user.customer_email, :subject => "Welcome to Ranga's Financial ENTRPRISE. ")
  end
   
end
