class HomeController < ApplicationController
	before_action :authenticate_user!, except: [:index, :home ,:browse_exp]




def index
	
end

def share_exp
	end

	def browse_exp
	end


end
