class Operator::User < ApplicationRecord
    has_secure_password
    validates :nickname, :password, :presence=>true
end
