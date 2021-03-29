class Tweet < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many :comments
  has_one_attached :attachment

  def self.search(search)
    if search != ""
      Tweet.where('title LIKE(?)', "&#{search}%")
    else
      Tweet.includes(:user).order("created_at DESC")
    end
  end
end
