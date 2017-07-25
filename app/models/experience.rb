class Experience < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :upvotes, dependent: :destroy



def upvoted_by 
  	Upvote.where(experience_id: experience_id).length > 0
  end

  def score
    Upvote.count.all
  end
  
end
