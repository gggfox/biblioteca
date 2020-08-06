class ReviewsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user,   only: :destroy

    def show
        @review = Review.find(params[:id])
    end

    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
            redirect_to root_url
        else
            render 'static_pages/home'
        end
    end

    def destroy

    end

    private
        def review_params
            params.require(:review).permit(:title, :author, :content)
        end

        def correct_user    
            @review = current_user.reviews.find_by(id: params[:id])
            redirect_to root_url if @review.nil?
        end
end
