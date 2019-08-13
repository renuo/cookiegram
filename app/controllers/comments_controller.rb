class CommentsController < ApplicationController
  include SessionsHelper

  def create
    if is_logged_in?
      @post = Post.find(params[:post_id])
      @comment = Comment.new({
          post: @post,
          message: params[:comment][:message],
          user: @current_user
      })

      if @comment.save
        redirect_to @post
      else
        render 'new'
      end
    else
      render 'new'
    end
  end

end
