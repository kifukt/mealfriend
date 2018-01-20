class StaticController < ApplicationController
    def index
        @ingredients = Ingredient.all
    end
    def feed
        
    end
end
