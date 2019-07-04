class PostsController < ApplicationController
  before_action :post_id_set, only:[:show,:destroy,:edit,:update]

  def index
    @posts=Post.all
  end

  def new
    if params[:back]
      @post=Post.new(post_params)
    else
      @post=Post.new
    end
  end

  def create
    @post=Post.new(post_params)
    if @post.save
      redirect_to posts_path,notice:'ブログを作成しました'
    else
      render 'new'
    end
  end

  def show
  end

  def destroy
    @post.destroy
    redirect_to posts_path,notice: '削除されました'
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path,notice:'ブログを編集しました'
    else
      render 'edit'
    end
  end

  def confirm
    @post=Post.new(post_params)
    render :new if @post.invalid?
  end

  private

  def post_id_set
    @post=Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title,:content)
  end
end
