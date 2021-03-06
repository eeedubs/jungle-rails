class Admin::CategoriesController < ApplicationController
    before_action :authorize
    
    http_basic_authenticate_with name: ENV['ADMIN_NAME'], password: ENV['ADMIN_PASS']

    def index
        @categories = Category.order(id: :asc).all
    end
    
    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)

        if @category.save
            puts "#{@category.name} was successfully created!"
            redirect_to [:admin, :categories], notice: 'Category created!'
        else
            render :new
        end
    end

    def destroy
        @category = Category.find params[:id]
        @category.destroy
        redirect_to [:admin, :categories], notice: 'Categories deleted!'
      end
    
    private

    def category_params
      params.require(:category).permit(
        :name
      )
    end
    
end
