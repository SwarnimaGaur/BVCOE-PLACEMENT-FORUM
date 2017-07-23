class ExperienceController < ApplicationController
	before_action :authenticate_user!, except: [:browse_exp]

	def share_exp
	@experience = Experience.new

	end

	def browse_exp
		@experiences =Experience.includes(:comments).all.order(created_at: :desc)
		@comment =Comment.new
		@comments =Comment.where(experience_id: params[:experience_id])
		@upvotes =Upvote.where(experience_id: params[:experience_id], user_id: params[:user_id])
	
	end

	def create
	@experience=Experience.new(experience_params)
	@comment = Comment.new( :experience => @experience )
	@experience.user_id = current_user.id
	@experience.save
	if @experience.save
	      redirect_to url_for(:controller => :home, :action => :index)
	    else
	      redirect_to url_for(:controller => :home, :action => :index)
	    end
	end

	def experience_params

	  params.require(:experience).permit(:round_no, :content, :tips, :user_id)
		end

end

