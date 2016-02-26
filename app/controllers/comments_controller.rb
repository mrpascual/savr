class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    if @comment.save
      redirect_to post_path(@post)
    else
      flash.now.alert = "Dang dude. Didn't work"
      render :new
    end
  end

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
    def comment_params
      params.require(:comment).permit(:title, :body, :user_id, :post_id)
    end
  end






