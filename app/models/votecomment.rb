class Votecomment < ApplicationRecord
    belongs_to :user
    belongs_to :comment

    validates_uniqueness_of :user_id, scope: :comment_id

    after_create :increment_votecomment
    after_destroy :decrement_votecomment

    private

    def increment_votecomment
        field = self.upvote ? :upvotes : :downvotes
        Comment.find(self.comment_id).increment(field).save
    end

    def decrement_votecomment
        field = self.upvote ? :upvotes : :downvotes
        Comment.find(self.comment_id).decrement(field).save
    end


end

