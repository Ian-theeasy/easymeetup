class User < ActiveRecord::Base
	has_many :comments
	has_many :issues
	has_secure_password

	# name validates
	validates_presence_of :name, :message => "Please input a username"
	validates_uniqueness_of :name,:case_sensitive => false, :message => "the username exists"
	validates_length_of :name, :in => 5..15, :message => "username length is 5-15"
	# email validates
	validates_presence_of :email, :message => "Please input an email"
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "email address is not valid"
	validates_uniqueness_of :email,:case_sensitive => false, :message => "the email has been registed"
	# password validates
	validates_presence_of :password, :message => "Please input a password"
	validates_length_of :password, :in => 6..15, :message => "password length is 6-15"
	# password confirmation validates
	validates_presence_of :password_confirmation, :message => "Please input your password again"
	validates_confirmation_of :password,  :message => "passwords don't match "

	before_create { generate_token(:auth_token) }

	def generate_token(column)
	  begin
	    self[column] = SecureRandom.urlsafe_base64
	  end while User.exists?(column => self[column])
	end

	def avatar
  	gravatar_id = Digest::MD5.hexdigest(self.email.downcase) if self.email
  	"http://gravatar.com/avatar/#{gravatar_id}.png?s=512&d=retro"
	end
end
