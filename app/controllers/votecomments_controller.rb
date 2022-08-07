class VotecommentsController < ApplicationController

    def create
        comment_id = params[:comment_id]

        votecomment = Votecomment.new
        votecomment.comment_id = params[:comment_id]
        votecomment.upvote = params[:upvote]
        votecomment.user_id = current_user.id

        existing_votecomment = Votecomment.where(user_id: current_user.id, comment_id: comment_id)
        @new_votecomment = existing_votecomment.size < 1

        respond_to do |format|
            format.js {
                if existing_votecomment.size > 0
                    existing_votecomment.first.destroy
                else
                    if votecomment.save
                        @success = true
                    else
                        @success = false
                    end

                end
                @comment = Comment.find(comment_id)
                @is_upvote = params[:upvote]
                render "votecomments/create"
            }
        end
    end







    private

    def vote_params
        params.require(:votecomment).permit(:upvote, :comment_id)
    end

end
