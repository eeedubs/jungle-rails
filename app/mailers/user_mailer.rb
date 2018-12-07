class UserMailer < ApplicationMailer
default from: "no-reply@jungle.com"

    def order_email(email, order)
        @email = email
        @order = order
        mail(to: email, subject: "Order Confirmation ID: #{@order.id}")
    end
end
