class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # relationship
  has_one_attached :avatar
  has_many :stories
  has_many :follows

  validates :username, presence: true, uniqueness: true   

  # check current user has follow another user or not?
  def follow?(user)
    follows.exists?(following: user)
  end
  
  def follow!(user)
    if follow?(user)
      follows.find_by(following: user).destroy
      return "取消追蹤"
    else
      follows.create(following: user)
      return "追蹤"
    end
  end

end

# copy of teacher's code 
# def follow?(user)
#   follows.exists?(following: user)
# end

# def follow!(user)
#   if follow?(user)
#     follows.find_by(following: user).destroy
#     return 'Follow'
#   else
#     follows.create(following: user)
#     return 'Followed'
#   end
# end
