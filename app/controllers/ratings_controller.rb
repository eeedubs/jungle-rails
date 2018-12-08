class RatingsController < ApplicationController
    before_filter :check

    def create
        @product = Product.find params[:product_id]
        @user = User.find session[:user_id]
        @new_rating = @product.ratings.create({
            product_id: @product.id, 
            user_id: current_user.id, 
            description: rating_params[:description], 
            rating: rating_params[:rating],
        })
        if @new_rating.save
            puts "Review was successfully saved."
            rating_params.clear
            redirect_to :back
        end
    end

    def destroy
        @rating = Rating.find(params[:id])
        @rating.destroy
        redirect_to :back
    end

    def check
        unless current_user
            redirect_to '/'
        end
    end

    def rating_params
        params.require(:rating).permit(:product_id, :user_id, :description, :rating)
    end
end
