class Upvote < ActiveRecord::Base
  belongs_to :experience
  belongs_to :user
  belongs_to :answer

  validates :experience, uniqueness: {scope: :user}
  validates :answer, uniqueness: {scope: :user}

end
