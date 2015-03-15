class Article < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :url, presence: true, length: { minimum: 7 }
end
