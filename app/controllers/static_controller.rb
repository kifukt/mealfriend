class StaticController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :require_token, only: [:feed]
    swagger_controller :students, 'Students'

    def index
        @ingredients = Ingredient.all
    end

    swagger_api :feed do
        summary "Shows a feed for authenticated used"
        param :header, "Authorization", :string, :required, "Authentication token"
    end
    def feed
        
    end
end
