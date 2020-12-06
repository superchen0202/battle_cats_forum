class Story < ApplicationRecord

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  include AASM  
  aasm(column: 'status', no_direct_assignment: true)do
  
    state :draft, initial: true
    state :published

    event :publish do
      transitions from: :draft, to: :published

      after do
        puts "文章已發布，請至信箱確認！"
      end

    end

    event :unpublish do
      transitions from: :published, to: :draft
    end
  end

  belongs_to :user
  has_one_attached :cover_img

  validates :title, presence: true      
  
  default_scope{ where(deleted_at: nil) } #soft delete
  #scope :published_stories, -> {where(status: "published")}
  scope :published_stories, -> {published.with_attached_cover_img.order(created_at: :desc).includes(:user)}
  
  def destoy
    update(deleted_at: Time.now)
  end

   # instance methods
   def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

  private
  def slug_candidates
    [
      :title,
      [:title, SecureRandom.hex[0,8]]
    ]
  end
end