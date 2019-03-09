class User::User < ApplicationRecord
    has_secure_password
    validates :nickname, :email, :password, :presence=>true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
 