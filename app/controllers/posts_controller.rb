class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @posts = Post.all.includes(:user).order(id: "DESC")
    if params[:search] == nil
      redirect_to root_path
    else
      @posts = @posts.search(params[:search])
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @post.memories.build
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    post = Post.new(post_params)

    post.save!

    params[:memories][:image].each do |image|
      post.memories.create(image: image, post_id: post.id)
    end
    redirect_to root_path
  end

  def update
    post = Post.find(params[:id])

    if post.title != params[:post][:title]

      post.update!(post_params)

    else
      post.save!

      params[:memories][:image].each do |image|
        post.memories.create(image: image, post_id: post.id)
      end
    end

    redirect_to root_path
  end

  def destroy
    @post = Post.find(params[:id])

    @post.destroy!

    redirect_to root_path
  end

  private

    def post_params
      params.require(:post).permit(:title, :user_id, memories_attributes: [:image]).merge(user_id: current_user.id)
    end

    def update_post_params
      params.require(:post).permit(:title, :user_id, memories_attributes: [:image, :id, :_destroy]).merge(user_id: current_user.id)
    end
end
