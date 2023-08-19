class CategoryController < ApplicationController

    def index
        @categories = Category.all
        render json: { categories: @categories }, status: 200 
    end
end
