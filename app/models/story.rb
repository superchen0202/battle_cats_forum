class Story < ApplicationRecord

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

  validates :title, presence: true
  default_scope{ where(deleted_at: nil) }

  def destoy
    update(deleted_at: Time.now)
  end
end