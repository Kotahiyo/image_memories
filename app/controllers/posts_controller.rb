class PostsController < ApplicationController
  def index

  end

  def show

  end

  def new
    @post = Post.new
  end

  def edit

  end

  def create
    binding.pry
    Post.create(post_params)
  end

  def update

  end

  def destroy

  end

  private

  def post_params
    paramas.requie(:post).permit(:title)
  end
end
