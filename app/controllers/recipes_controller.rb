class RecipesController < ApplicationController
    before_action :find_recipe, only: [:show, :edit, :update, :destroy ]  
   
   def index
       @recipes = Recipe.all    
   end
   
   def show
       
   end

   def new
      @recipe = Recipe.new
      @recipe.ingredients.build(name: "First Ingredient")
      @recipe.ingredients.build(name: "Second Ingredient")
      @recipe.ingredients.build(name: "Third Ingredient")
      @recipe.ingredients.build(name: "Fourth Ingredient")
      @recipe.ingredients.build(name: "Fith Ingredient")
      @recipe.ingredients.build(name: "Sixth Ingredient")
      @recipe.ingredients.build(name: "Seventh Ingredient")
      @recipe.ingredients.build(name: "Eighth Ingredient")
      @recipe.equipment.build(name: "First Tool")
      @recipe.equipment.build(name: "Second Tool")
      @recipe.equipment.build(name: "Third Tool")
      @recipe.equipment.build(name: "Fourth Tool")
      @recipe.equipment.build(name: "Fith Tool")
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
       category_attributes: [ :type],
       ingredient_attributes: [ :item, :quantity ],
       equipments_attributes: [ :tool]
    )       
   end
   
   def find_recipe
      @recipe = Recipe.find_by_id(params[:id])
    end

end 
   
