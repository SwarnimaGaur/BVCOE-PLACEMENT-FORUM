class Upvote < ActiveRecord::Base
  belongs_to :experience
  belongs_to :user

end
