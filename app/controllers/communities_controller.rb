class CommunitiesController < ApplicationController
before_action :authenticate_user!, except: [ :index, :show ]
before_action :set_community, only: [ :show ]

    def index
        @communities = Community.all
    end

    def show
        @posts = @community.posts.sort_by{|p| p.score}.reverse
        @subscriber_count = @community.subscribers.count
        @is_subscribed = user_signed_in? ? Subscription.check_if_user_signed_in(@community, current_user) : false
        @subscription = Subscription.new
    end

    def new
        @community = Community.new
    end

    def create
        @community = Community.new(community_params)

        @community.user_id = current_user.id
        if @community.save
            redirect_to communities_path
        else
            render :new
        end
    end

    private

    def set_community
        @community = Community.includes(:posts).find(params[:id])
    end

    def community_params
        params.require(:community).permit(:name, :rules, :summary)
    end
end
