class HomeController < ApplicationController
	before_action :authenticate_user!, except: [:index]


def index
	
end

# def share

# @experience= Experience.new
# @experience.round_no= params[:round_no]
# @experience.content= params[:content]
# @experience.tips= params[:tips]
# @experience.save

# end



	def create
	# 	if @experience.save
 #  flash[:success] = "Thanks! I'll be in touch soon!"
 #  redirect_to :action => 'index'
 # else
  render :action => 'index'
# end
	end


end
