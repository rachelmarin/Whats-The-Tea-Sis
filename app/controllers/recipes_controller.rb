class recipesController < ApplicationController
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

   
      end 
   
