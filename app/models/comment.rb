class Comment < ApplicationRecord
  validates  :body,             presence: true
  validates  :commentable_id,   presence: true
  validates  :commentable_type, presence: true
  belongs_to :commentable,      polymorphic: true
  has_many   :comments,         as: :commentable
  belongs_to :walmart_product
  belongs_to :user
end
