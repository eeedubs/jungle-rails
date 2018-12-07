class UserMailer < ApplicationMailer
<<<<<<< HEAD
default from: "no-reply@jungle.com"

    def order_email(email, order)
        @email = email
        @order = order
        mail(to: email, subject: "Order Confirmation ID: #{@order.id}")
    end
=======
    default from 'no-reply@jungle.com'

    def order_email
        @user = params[:user]
        @url = 'http://localhost:3000/orders/:id'
        mail(to: @order.email, subject: 'Confirmation of Order ID: <%= @order.id %>')
    end

>>>>>>> 6a942e81ffda9a987f50cd73ff23743b41d15591
end
