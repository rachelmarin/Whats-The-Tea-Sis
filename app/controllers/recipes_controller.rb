class RecipesController < ApplicationController
    before_action :find_category, only: [:index, :new, :create]
    before_action :find_recipe, only: [:show, :edit, :update, :destroy ]
    layout "recipes_layout"  
   def index
      if @category
         @recipe = @category.recipe
      else
       @recipes = Recipe.all    
      end
   end
   def show
       
   end

   def new
      if @category
         @recipe = @category.recipe.build
         render :new_category_recipe
      else
         @recipe = current_user.recipes.build

         @recipe.ingredients.build(name: "")
         @recipe.ingredients.build(name: "")
         @recipe.ingredients.build(name: "")
         @recipe.ingredients.build(name: "")
         @recipe.ingredients.build(name: "")
         @recipe.ingredients.build(name: "")
         @recipe.ingredients.build(name: "")
         @recipe.ingredients.build(name: "")
      end
   end
   def create
         @recipe = current_user.recipes.build(recipe_params)
      if @recipe.save
         #if valid
         if @category
            redirect_to category_recipe_path(@category)
         else   
            redirect_to recipes_path
         end
      else
         #if not valid
         flash.now[:error] = @recipe.errors.full_messages
         
         if @category
            render :new_category_recipe
         else
            render :new
         end
      end
   end

   def edit       
   end

   def update
      if @recipe.update(recipe_params)
         redirect_to recipe_path(@recipe)
      else 
          flash.now[:error] = @recipe.errors.full_messages
          render :edit
      end
   end 

   def destroy
      @recipe.destroy
      flash[:notice] = "#{@recipe.title} was deleted"
      redirect_to recipes_path           
   end

   private
   
   def find_recipe
      @recipe = Recipe.find(params[:id])
    end

    def find_category
      if params[:category_id]
        @category = Category.find_by_id(params[:category_id])
      end
    end

   def recipe_params
      params.require(:recipe).permit(
       :title,
       :instructions,
       :category_id,
       category_attributes: [:name],
       ingredient_attributes: [:name, :quantity]
    )       
   end
end 
   
