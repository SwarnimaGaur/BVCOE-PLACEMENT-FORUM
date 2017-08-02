class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  enum role: {user: 0,admin: 1}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :experiences
  has_many :comments
  has_many :upvotes


def self.search(search)
  where("name LIKE ? OR email LIKE ? OR company ? OR year_pass company ? OR branch ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
end

end
