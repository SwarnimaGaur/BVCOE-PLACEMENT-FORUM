class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :experience


  def self.search(search)
    where("com ILIKE ? OR user_id ILIKE ? OR experience_id ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
