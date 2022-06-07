class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 3 }
  validates :password_confirmation, presence: true, length: { minimum: 3 }

  def self.authenticate_with_credentials(email, password)

    if (email.nil? || password.nil?) 
      return nil
    end
    
    User.find_by(email: email.strip.downcase)&.authenticate(password)
  end 
  

  # def create
  #   if user = User.authenticate_with_credentials(params[:email], params[:password])
  #     # success logic, log them in
  #   else
  #     # failure, render login form
  #   end
  # end

end
