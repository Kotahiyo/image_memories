module Api
  module V1
    class PostsController < BaseApiController
      # before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
      def index
        posts = Post.order(updated_at: :desc)

        render json: posts, each_serializer: Api::V1::PostSerializer
        # @posts = Post.all.includes(:user).order(id: "DESC").page(params[:page]).per(8)
        # @posts = @posts.search(params[:search]) if params[:search]
      end

      def show
        post = Post.find(params[:id])
        render json: post, serializer: Api::V1::PostSerializer
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
        render json: post, serializer: Api::V1::PostSerializer

        # if @post.save

        #   if params[:memories][:image]
        #     params[:memories][:image].each do |image|
        #       @post.memories.create(image: image, post_id: @post.id)
        #     end
        #   end

        #   redirect_to root_path

        # else
        #   render "new"
        # end
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
          # params.require(:post).permit(:title, :user_id, memories_attributes: [:image]).merge(user_id: current_user.id)
          params.require(:post).permit(:title, :user_id).merge(user_id: current_user.id)
        end

        def update_post_params
          params.require(:post).permit(:title, :user_id, memories_attributes: [:image, :id, :_destroy]).merge(user_id: current_user.id)
        end
    end
  end
end
