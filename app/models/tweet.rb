class Tweet < ApplicationRecord
  validates :title, presence: true

  belongs_to :user

  has_many :comments
  accepts_nested_attributes_for :comments

  has_one_attached :attachment

  validates :attachment, presence: true

  def self.search(search)
    if search != ""
      Tweet.where('title LIKE(?)', "&#{search}%")
    else
      Tweet.includes(:user).order("created_at DESC")
    end
  end
end
