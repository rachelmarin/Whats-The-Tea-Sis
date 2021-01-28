class RecipesController < ApplicationController
    before_action :find_recipe, only: [:show, :edit, :update, :destroy ]  
   
   def index
       @recipes = Recipe.all    
   end
   
   def show
       
   end

   def new
      @recipe = Recipe.new
   end
    
   def create
         @recipe = Recipe.new(recipe_params)
      if @recipe.save
         redirect_to recipes_path
      else
         flash.now[:error] = @recipe.errors.full_messages
         render :new
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
   end

   private
   
   def recipe_params
      params.require(:recipe).permit(
       :title,
       :category_id,
       category_attributes: [:type]
    )       
   end
   
   def find_recipe
      @recipe = Recipe.find_by_id(params[:id])
    end

end 
   
