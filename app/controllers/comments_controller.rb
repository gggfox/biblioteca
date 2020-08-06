class CommentsController < ApplicationController
  before_action :logged_in_user,  only: [:create, :delete]
  before_action :correct_user,    only: :destroy

  def create
    @comment = current_user.comments.build(comment_params)
  end

  def destroy
  end

  private

    def comment_params
        params.require(:review).permit(:content)
    end

    def correct_user
      @review = current_user.comments.find(id: params[:id])
      redirect_to root_url if @review.nil?
    end
end
