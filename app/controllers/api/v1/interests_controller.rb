class Api::V1::InterestsController < ApplicationController
    def index
        interests = Interest.all 
        render json: interests.as_json(except: [:created_at, :updated_at, :id])
    end
end