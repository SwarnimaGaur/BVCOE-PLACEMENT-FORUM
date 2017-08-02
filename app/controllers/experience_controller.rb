class ExperienceController < ApplicationController
	before_action :authenticate_user!, except: [:browse_exp]

def search

@experiences= Experience.search(params[:search])
if @experiences
else
	render :text => "NO experience !"
end
end


	def share_exp

	@experience = Experience.new
	end


	def edit
		@experience= Experience.find(params[:id])
end


def update
	 @experience = Experience.find(params[:experience_id])
	 @experience.save
  @experience.update(round_no: params[:round_no], content: params[:content],tips: params[:tips])
  # @experience.save
  redirect_to url_for(:controller => :experience, :action => :browse_exp)
end

	def browse_exp
		 @experiences =Experience.includes(:comments, :upvotes).all.order(created_at: :desc)
		# @user_name=@experiences.user.name

		
		if params[:search]
    @experiences = Experience.search(params[:search]).order("created_at DESC")
     redirect_to url_for(:controller => :experience, :action => :search)
  else
    @experiences
  end
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


def destroy
	
		
		 @experience = Experience.find(params[:experience_id])
		 if current_user.admin? 
		 @experience.destroy

		redirect_to url_for(:controller => :experience, :action => :browse_exp)

	elsif current_user.id == @experience.user_id 
		 
		 @experience.destroy

		redirect_to url_for(:controller => :experience, :action => :browse_exp)
	else 
		redirect_to url_for(:controller => :experience, :action => :browse_exp)
    end
end

end

