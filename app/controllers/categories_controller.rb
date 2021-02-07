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

        2.times { @category.recipes.build }
       
      end
      
      def create
        params[:category][:user_id] = current_user.id
        @category = Category.new(category_params)
        if @category.save
          redirect_to categories_path(@category)
        else
          flash.now[:error] = @category.errors.full_messages
          render :new
        end
      end
      
      def edit
    
      end
    
      def update
        if @category.update(category_params)
          redirect_to category_path(@category)
        else
          flash.now[:error] = @category.errors.full_messages
          render :edit
        end
      end
    
     
      private
      def find_category
        @category = Category.find(params[:id])
      end

    def category_params
      params.require(:category).permit(
        :name,
        :user_id,
        recipes_attributes: [:title, :description, :category_id, :user_id],
        ingredients_attributes: [:id, :name, :quantity, :_destroy],
        directions_attributes: [:id, :step, :_destroy]
      )
    end
  end


