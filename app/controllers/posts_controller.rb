class PostsController < ApplicationController
    before_action :authenticate_user!, except: [ :index, :show ]
    before_action :set_posts, only: [ :show ]
    before_action :auth_subscriber, only: [ :new ]

        def index
            @posts = Post.all
        end

        def show
            @comment = Comment.new
        end

        def new
            @community = Community.find(params[:community_id])
            @post = Post.new
        end

        def create
            @post = Post.new(post_params)

            @post.user_id= current_user.id
            @post.community_id = params[:community_id]
            if @post.save
                redirect_to community_path(@post.community_id)
            else
                @community = Community.find(params[:community_id])
                render :new
            end
        end


      # def destroy
      #   @post.destroy
      #   respond_to do |format|
      #     format.html { redirect_to records_url, danger: 'Post was successfully deleted.' }
      #     format.json { head :no_content }
      #   end
      # end

        private

        def set_posts
            @post = Post.includes(:comments).find(params[:id])
        end

        # refactor scope method, place it in Post model or Subscription model?
        def auth_subscriber
        # #    unless Subscription.check_if_account_signed_in(community.id = params[:community_id], current_account)
        # #     redirect_to root_path, flash: { error: "You are not authorized to view this page" }
        # #    end
        unless Subscription.where(community_id: params[:community_id], user_id: current_user.id).any?
            redirect_to root_path, flash: {error: "You do not have authorization to access this page"}
        end
        end

        def post_params
            params.require(:post).permit(:title, :body)
        end
    end
