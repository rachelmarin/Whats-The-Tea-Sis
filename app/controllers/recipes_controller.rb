class recipesController < ApplicationController
    before_action :find_recipe, only: [:show, :edit, :update, :destroy ]  
   
       def index
       @recipes = Recipe.all    
       end
   
       def show
       
       end
   
      end 
   
