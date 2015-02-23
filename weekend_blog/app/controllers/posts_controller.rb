class PostsController < ApplicationController

  def index
    @author = Author.find params[:author_id]
    @posts = @author.posts
  end

  def show
    @post = Post.find params[:id]
    @author = @post.author
  end

  def new
    @author = Author.find params[:author_id]
    @post = Post.new
  end

  def create
    @author = Author.find params[:author_id]
    @post = Post.new post_params
    @post.author = @author
    if @post.save
      redirect_to author_posts_path(@author)
    else
      render :new     #return to above verb
    end
  end

  def edit
    @post = Post.find params[:id]
    @author = @post.author          #the @author is equal to the author value of this post
  end

  def update
    @post = Post.find params[:id]
    @author = @post.author
    if @post.update_attributes post_params
      redirect_to post_path(@post)
    else
      render :edit      #return to above verb
    end
  end

  def destroy
    post = Post.find params[:id]
    post.destroy
    redirect_to author_post_path(book.author)
  end

private
  def post_params
    params.require(:post).permit(:title, :body, :catagory)
  end

end
