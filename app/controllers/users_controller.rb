class UsersController < ApplicationController

    def new
    end

    def create
            
        if user_params[:password].length < 8
            redirect_to '/signup', :flash => { notice: "Please enter a password with a minimum of 8 characters" }
        elsif User.find_by_email(user_params[:email])
            redirect_to '/signup', :flash => { notice: "A user with this email already exists" }
        else
            user = User.new(user_params)
            if user.save
                redirect_to '/'
                session[:user_id] = user.id
            else
                redirect_to '/signup'
            end
        end
    end

    private 
    
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
