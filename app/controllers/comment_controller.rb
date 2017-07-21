class CommentController < ApplicationController
  def create
  @experience = Experience.find(params[:experience_id])
  @comment = @experience.comments.create(comment_params)
  @comment.com =params[:com]
  @comment.user_id = current_user.id 
  @comment.experience_id = params[:experience_id]

  if @comment.save
    redirect_to url_for(:controller => :experience, :action => :browse_exp)
  else
    flash.now[:danger] = "error"
  end
 end



 def comment_params
        params.require(:comment).permit(:com, :experience_id)
   end

  
  def destroy
  	

  end
end
