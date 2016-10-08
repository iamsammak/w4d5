class PostsController < ApplicationController
  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    @post.sub_id = @post.sub_id.to_i 
    if @post.valid?
      @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = Post.update(params[:id], post_params)
    if @post.valid?
      @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    sub = @post.sub_id
    @post.delete
    redirect_to sub_url(sub)
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id)
  end
end
