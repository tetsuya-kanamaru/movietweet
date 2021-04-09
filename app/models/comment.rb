class Comment < ApplicationRecord
  validates :comment, presence: true

  belongs_to :tweet
  belongs_to :user
end
