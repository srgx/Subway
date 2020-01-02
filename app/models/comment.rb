class Comment < ApplicationRecord
  belongs_to :book
  validates :commenter, presence: true
  validates :body, presence: true
end
