class ReviewsController < ApplicationController
    def show 
        @review = Review.find_by_id(params[:id])
    end 
end
