class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # relationship
  has_one_attached :avatar
  has_many :stories
  has_many :follows
  has_many :likes
  has_many :bookmarks

  validates :username, presence: true, uniqueness: true   

  def bookmark?(story)
    bookmarks.exists?(story_id: story.id)
  end

  def bookmark!(story)
    
    if bookmark?(story)
      bookmarks.find_by(story_id: story.id).destroy
      return "取消收藏"
    
    else
      bookmarks.create(story_id: story.id)
      return "收藏"
    end

  end

  def follow?(user)
    follows.exists?(following: user)
  end
  
  def follow!(user)
    if follow?(user)
      follows.find_by(following: user).destroy
      return "追蹤"
    else
      follows.create(following: user)
      return "追蹤中"
    end
  end

  def like?(story)
    likes.exists?(story_id: story.id)
  end

  def like!(story)
    
    if like?(story)
      likes.find_by(story_id: story.id).destroy
      return "收回讚"
    else
      likes.create(story_id: story.id)
      return "讚讚讚"
    end

  end

end