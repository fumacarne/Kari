class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many_attached :images

  default_scope {order(created_at: :desc)}
end
