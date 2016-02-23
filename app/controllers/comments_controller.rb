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
    @comment = @post.comments.create!(params.require(:comment).permit!)
    redirect_to post_path(@post)
  end
    # @comment = Comment.new(params.require(:comment).permit(:body))

    # if @comment.save
    #   redirect_to comments_path
    # else
    #   render :new
    # end
  end






