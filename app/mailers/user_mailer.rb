class UserMailer < ApplicationMailer
    default from 'no-reply@jungle.com'

    def welcome_email
        @user = params[:user]
        @url = 'http://localhost:3000/orders/:id'
        mail(to: @order.email, subject: 'Welcome to my awesome site!')
    end

end
