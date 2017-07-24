class ExperienceController < ApplicationController
	before_action :authenticate_user!, except: [:browse_exp]

	def share_exp
	@experience = Experience.new

	end


	def edit
		@experience= Experience.find(params[:experience_id])
end


def update
	 @experience = Experience.find(params[:experience_id])
  @experience.update(round_no: params[:round_no], content: params[:content])
  redirect_to url_for(:controller => :experience, :action => :browse_exp)
end

	def browse_exp
		@experiences =Experience.includes(:comments, :upvotes).all.order(created_at: :desc)
		
			end

	def create
	@experience=Experience.new(experience_params)
	# @comment = Comment.new(experience: => @experience )
	@experience.user_id = current_user.id
	@experience.save
	if @experience.save
	      redirect_to url_for(:controller => :home, :action => :index)
	    else
	      redirect_to url_for(:controller => :home, :action => :index)
	    end
	end

	def experience_params

	  params.require(:experience).permit(:round_no , :content, :tips)
		end
def edit
@experience=Experience.find(params[:experience_id])

end

def destroy
 	@experience = Experience.find(params[:experience_id])
	@experience.destroy
	redirect_to url_for(:controller => :experience, :action => :browse_exp)
end

end

