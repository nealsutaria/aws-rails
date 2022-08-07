class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user
    has_many :votecomments
    validates_presence_of :message, :user_id, :post_id

     def score
        if self.upvotes > 0 || self.downvotes > 0
            self.upvotes > 0 ? (self.upvotes - self.downvotes) : (self.downvotes * -1)
        else
            0
        end
    end
end
