class CategoriesController < ApplicationController

    def new  
        @category = Category.new
        @category.recipes.build
        @category.recipes.build
        @category.recipes.build
      end
      
      def create
        @category = Category.new(category_params)
    
    
        if @category.save
          redirect_to recipes_path
        else
          render :new
        end
      end
      private


    def category_params
      params.require(:category).permit(
        :name,
        recipes_attributes: [:title, :instructions],
        ingredient_attributes: [:item, :quantity]
      )
    end
end


