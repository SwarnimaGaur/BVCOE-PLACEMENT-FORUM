class UpvoteController < ApplicationController

  def create
 @upvote = Upvote.new(secure_params)
    @upvote.experience = Experience.find(params[:experience_id].to_i)
    @upvote.experience_id= params[:experience_id]
    @upvote.user_id= params[:user_id]
    if @upvote.save
      respond_to do |format|
        format.html { redirect_to @upvote.experience }
        format.js # we'll use this later for AJAX!
      end
    end
  end

def secure_params
params.require(:upvote).permit(:user_id, :experience_id)
end
  def destroy
  end
end
