class CategoriesController < ApplicationController
  before_action :redirect_if_not_logged_in
  before_action :find_category, only: [:edit, :new, :update, :destroy]
  before_action :find_recipe, only: [:show, :edit, :update, :destroy ]

    def index
      @categories = Category.all.alphabetize 
    end 

    def show
      @category = Category.find_by_id(params[:id])
    end

    def new  
        @category = current_user.categories.new

        @category.recipes.build
        @category.recipes.build
       
      end
      
      def create
        params[:category][:user_id] = current_user.id
        @category = current_user.categories.new(category_params)
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
    
      def destroy
        @category = Category.find(params[:id])
        if @category.present?
          @category.destroy
        end
        redirect_to categories_path
    end
      private
    

    def category_params
      params.require(:category).permit(
        :name,
        :user_id,
        recipes_attributes: [:title, :description, :category_id, :user_id]
      )
    end
  end


