class Upvote < ActiveRecord::Base
  belongs_to :experience
  belongs_to :user

  validates :experience, uniqueness: { scope: :user }


end
