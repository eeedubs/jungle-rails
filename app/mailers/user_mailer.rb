class UserMailer < ApplicationMailer
    default from 'no-reply@jungle.com'

    def order_email
        @user = params[:user]
        @url = 'http://localhost:3000/orders/:id'
        mail(to: @order.email, subject: 'Confirmation of Order ID: <%= @order.id %>')
    end

end
