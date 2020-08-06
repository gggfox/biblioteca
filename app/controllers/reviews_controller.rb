class ReviewsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user,   only: :destroy

    def create

    end

    def destroy

    end

    private
        def review_params
            params.require(:microst).permit(:content)
        end

        def correct_user    
            @review = current_user.reviews.find_by(id: params[:id])
            redirect_to root_url if @review.nil?
        end
end
