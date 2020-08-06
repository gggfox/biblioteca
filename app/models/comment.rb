class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :review
    default_scope -> { order(created_at: :desc) }
    validates     :user_id,   presence: true
    validates     :content,   presence: true, length: { maximum: 140 }
    validates     :review_id, presence: true
end
