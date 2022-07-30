class PublicController < ApplicationController

    def index
        @communities = Community.all.limit(5)
        @posts1 = Post.includes(:community, :user)
        @posts = @posts1.sort_by{ |p| p.score }.reverse
    end

    def profile
        @profile = User.find_by(email: params[:email])
        @posts = @profile.posts
    end

end
