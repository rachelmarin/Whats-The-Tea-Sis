class CategoriesController < ApplicationController
  before_action :find_category, only: [:edit, :update, :destroy]

    def index
      @categories = Category.all.alphabetize 
    end 

    def show
      @category = Category.find_by_id(params[:id])
    end

    def new  
        @category = Category.new

        @category.recipes.build
        @category.recipes.build
        @category.recipes.build

        render :new_category_recipe_path
      end
      
      def create
        @category = Category.new(category_params)
    
    
        if @category.save
          redirect_to categories_path
        else
          flash.now[:error] = @category.errors.full_messages
          render :new
        end
      end

      private
      
    def category_params
      params.require(:category).permit(
        :name,
        recipes_attributes: [:title, :description, :category_id],
        ingredients_attributes: [:id, :name, :quantity, :_destroy],
        directions_attributes: [:id, :step, :_destroy]
      )
    end
  end


