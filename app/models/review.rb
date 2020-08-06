class Review < ApplicationRecord
  belongs_to :user
  has_rich_text :content
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 600 }
  validates :title,   presence: true, length: { maximum: 32  }
  validates :author,  presence: true, length: { maximum: 32  }
end
