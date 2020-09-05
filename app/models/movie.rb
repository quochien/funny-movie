class Movie < ApplicationRecord
  belongs_to :user
  validates :youtube_url, presence: true
  has_many :comments
end
