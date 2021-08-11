class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in
    def show 
        @review = Review.find_by_id(params[:id])
    end 
end
