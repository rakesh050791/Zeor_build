class UserMailer < ActionMailer::Base
  default from: "halosys.tester@gmail.com"

  def send_mail(user)
  	    # @user= User.find(user)
  	    @token1 = user.confirmation_token
  	    mail(:to => user.email, :subject => "Welcome")
  end
  
  def password_reset(user)
  	       @token = user.password_reset_token
  	   	   mail(:to => user.email, :subject => "Reset password")
  end

end

