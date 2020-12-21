class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @posts = Post.all.includes(:user).order(id: "DESC")
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit

  end

  def create
    @post = Post.new(post_params)

    @post.save

    redirect_to root_path

  end

  def update

  end

  def destroy

  end

  private

  def post_params
    params.require(:post).permit(:title).merge(user_id: current_user.id)
  end
end
