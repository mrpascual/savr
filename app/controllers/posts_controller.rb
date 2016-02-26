class PostsController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC')
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

 def update
   @post = Post.find(params[:id])
   if @post.update_attributes(params.require(:post).permit(:body))
     redirect_to posts_path
   else
     render :edit
   end
 end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end

  def comment_params
    params.require(:comment).permit(:title, :body, :user_id, :post_id)
  end
end
