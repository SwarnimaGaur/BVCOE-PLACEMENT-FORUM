class CommentController < ApplicationController
  def create

  @experience = Experience.find(params[:experience_id].to_i)
  @comment = @experience.comments.new
  @comment.com =params[:com]
  @comment.experience_id = params[:experience_id]

  @comment.user_id = current_user.id 

  if @comment.save
    redirect_to url_for(:controller => :experience, :action => :browse_exp)
  else 
    redirect_to url_for(:controller => :experience, :action => :share_exp)
  end
 end



 # def comment_params
 #        params.require(:comment).permit(:com, :experience_id, :user_id)
 #   end

  
  def destroy
  	

  end
end
