module ApplicationHelper
    def render_nav_links
      content_tag("ul", class: "right") do
        if user_signed_in? 
            content_tag("li") do
              link_to("Tea Recipes", recipes_path)
            end + 
            content_tag("li") do
              link_to("Create Recipe", new_recipe_path)
            end + 
            content_tag("li") do
              link_to("Logout", destroy_user_session_path, method: "DELETE")
            end
        else
          content_tag("li") do
            link_to("Login", new_user_session_path)
          end + 
          content_tag("li") do
            link_to("Signup", new_user_registration_path)
          end
        end
      end
    end
  end