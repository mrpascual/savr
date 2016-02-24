class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
    @comments = Comment.all
  end

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
    # @comment = Comment.new(params.require(:comment).permit(:body))

    # if @comment.save
    #   redirect_to comments_path
    # else
    #   render :new
    # end
  private
    def comment_params
      params.require(:comment).permit(:title, :body, :user_id, :post_id)
    end
  end






