class CategoriesController < ApplicationController

    def new  
        @category = category.new


        @category.recipes.build
        @category.recipes.build
        @category.recipes.build
      end
           
end
