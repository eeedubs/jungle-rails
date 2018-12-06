class Admin::CategoriesController < ApplicationController
    def new
        @category = category.new
    end

    def create
        @category = category.new(category_params)

        if @category.save
            redirect_to [:admin, :categories], notice: 'Category created!'
        else
            render :new
    end
    
    private

    def product_params
      params.require(:category).permit(
        :name
        # :description,
        # :category_id
      )
    end
    
end
