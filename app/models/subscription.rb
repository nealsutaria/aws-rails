class Subscription < ApplicationRecord
    belongs_to :user
    belongs_to :community

    def self.check_if_user_signed_in(community, current_user)
        Subscription.where(community_id: community.id, user_id: current_user.id).any?
    end
end
