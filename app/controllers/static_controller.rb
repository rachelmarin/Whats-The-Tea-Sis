class StaticController < ApplicationController
    def home
        render layout: "home_page_layout"
      end  
end