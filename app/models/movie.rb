class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, :overview, presence: true
  validates :title, uniqueness: { case_sensitive: false }
end
