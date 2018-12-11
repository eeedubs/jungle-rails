class User < ActiveRecord::Base
    has_secure_password

    def self.authenticate_with_credentials(email, password)
        if password == nil || email == nil || password.length == 0 || email.length == 0
            return nil
        elsif password.length < 8 
            return nil
        else
            if user = User.find_by_email(email.strip.downcase)
                if user.authenticate(password)
                    return user
                else
                    return nil
                end
            else
                return nil
            end
        end
    end

    validates :name, presence: true
    validates :email,
        presence: true,
        uniqueness: { case_sensitive: false }
    validates :password_digest,
        presence: true
    validates :password,
        presence: true,
        length: { minimum: 8 }
end
