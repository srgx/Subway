class Book < ApplicationRecord
  belongs_to :author
  has_many :comments
  validates :title, presence: true
  validates :description, presence: true
end
