class Api::V1::InterestsController < ApplicationController
    def index
        interests = Interest.all 
        return json: interests
    end
end