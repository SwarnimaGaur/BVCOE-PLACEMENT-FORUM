class UpvoteController < ApplicationController

  def create

    # if Upvote.where(experience_id: params[:experience_id],user_id).exists?
    #    @upvote= Upvote.where(experience_id: params[:experience_id], user_id: current_user.id)
    #    @upvote.destroy
     
    @experience = Experience.find(params[:experience_id])
    @upvote = @experience.upvotes.new
    @upvote.experience_id= params[:experience_id]
    @upvote.user_id= params[:user_id]
    # respond_to do |format|

    #   format.js {    }
    if @upvote.save
 redirect_to url_for(:controller => :experience, :action => :browse_exp)
else
    redirect_to url_for(:controller => :experience, :action => :browse_exp)
    end
end
end

# def secure_params
# params.require(:upvote).permit(:user_id, :experience_id)
# end
  
