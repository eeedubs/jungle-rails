class User < ActiveRecord::Base
    has_secure_password

    validates :name, presence: true
    validates :email,
        presence: true,
        uniqueness: { case_sensitive: false }
    validates :password_digest, presence: true
end
