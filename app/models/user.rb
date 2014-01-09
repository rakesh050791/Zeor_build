class User < ActiveRecord::Base
  attr_accessible :address_1, :address_2, :age, :company_name,:password, :password_confirmation,:email, :gender, :phone, :username, :confirmation_token, :confirmation_token_sent_at
  validates_confirmation_of :password
  validates :age, :password, :email,:address_1,:address_2,:gender,:username,:phone,presence: true
  validates :email,:username, uniqueness: true
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }


	 def self.authenticate(email,password)
	 	user = User.find_by_email(email)
	 	if user && user.password.eql?(Digest::SHA1.hexdigest(password))
	 		user
	 	else
	 		false
	 	end
	 end
	 

	 def send_password_reset
	 	generate_token(:password_reset_token)
	 	self.password_reset_sent_at = Time.zone.now
	 	save!
	 	UserMailer.password_reset(self).deliver
	 end

	 def generate_token(column)
	 	begin
	 			self[column] = SecureRandom.urlsafe_base64
	 	end while User.exists?(column => self[column]) 			
	 end

	 def send_confirmation_token
		generate_token(:confirmation_token)
		self.confirmation_token_sent_at = Time.zone.now
		save!
		UserMailer.send_mail(self).deliver
	 end

 
end


