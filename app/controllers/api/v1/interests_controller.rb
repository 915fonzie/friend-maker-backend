class Api::V1::InterestsController < ApplicationController
    def index
        interests = Interest.all 
        render json: interests
    end
end