class Log::CommentsController < ApplicationController
  before_action :set_post, only: [:create, :destroy, :update]

  def create
    # TODO:
    #@comment = @post.comments.create(
    #            comment_params.merge(user_id: current_user.id))

    @comment = @post.comments.create(
                comment_params.merge(user_id: 1))
    redirect_to @post
  end

  def destroy
    @comment = Log::Comment.find(params[:id]).destroy
    redirect_to @post
  end

  private
    def set_post
      @post = Log::Post.find(params[:post_id])
    end

    def comment_params
      params.require(:log_comment).permit(:body)
    end
end
