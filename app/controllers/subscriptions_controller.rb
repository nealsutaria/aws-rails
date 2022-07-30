class SubscriptionsController < ApplicationController

    def create
        @subscription = Subscription.new(subscription_params)
        @subscription.user_id = current_user.id
        if @subscription.save
        redirect_to community_path(@subscription.community_id)
        end
    end

    private

    def subscription_params
        params.require(:subscription).permit(:community_id)
    end
end
