class Comment < ApplicationRecord
  belongs_to :post
  validates :username, presence: true, length: {minimum:2}
  validates :body, presence: true
end
