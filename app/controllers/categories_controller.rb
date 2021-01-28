class CategoriesController < ApplicationController

    def new  
        @category = category.new


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
    
end
