class UpvoteController < ApplicationController

  def create

    # if Upvote.where(experience_id: params[:experience_id],user_id).exists?
    #    @upvote= Upvote.where(experience_id: params[:experience_id], user_id: current_user.id)
    #    @upvote.destroy
     
    @experience = Experience.find(params[:experience_id])
    @upvote = @experience.upvotes.new
    @upvote.experience_id= params[:experience_id]
    @upvote.user_id= params[:user_id]
    @upvote.save
    respond_to do |format|
       format.js {    }
#     if 
#  redirect_to url_for(:controller => :experience, :action => :browse_exp)
# else
#     redirect_to url_for(:controller => :experience, :action => :browse_exp)
#     end
end
end

def destroy
@experience = Experience.find(params[:experience_id])
@upvote = @experience.upvotes.where(user_id: current_user.id).first
# puts '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
# puts '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
# puts '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
# puts '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
# puts '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
# puts '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
# puts '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
# puts @upvote.class
# puts @upvote.user

         if current_user.admin? 
         @upvote.destroy

        redirect_to url_for(:controller => :experience, :action => :browse_exp)
    elsif current_user.id == @upvote.user_id

         @upvote.destroy

        redirect_to url_for(:controller => :experience, :action => :browse_exp)
    else 
        redirect_to url_for(:controller => :experience, :action => :browse_exp)
    end
    end
end


# def secure_params
# params.require(:upvote).permit(:user_id, :experience_id)
# end
  
