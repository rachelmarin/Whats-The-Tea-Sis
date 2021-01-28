module RecipesHelper
    def category_name(recipe)
      if recipe.category
        recipe.category.name
      else
        link_to "Add Category", edit_recipe_path(recipe)
    end
  end   
end
