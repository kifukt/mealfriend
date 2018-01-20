class StaticController < ApplicationController
    before_action :require_token, only: [:feed]
    def index
        @ingredients = Ingredient.all
    end
    def feed
        
    end
end
