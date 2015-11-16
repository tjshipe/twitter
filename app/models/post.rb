class Post < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :body, presence: true, length: { maximum: 140 }

  scope :feed, -> (ids) { where(user_id: ids).order("created_at DESC") } 
  scope :search, -> (term) { where("body LIKE ?", "%#{term}%") }
end
