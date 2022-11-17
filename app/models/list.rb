class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  # should destroy child saved movies when destroying self
  # When you delete a list, you should delete all associated bookmarks
  # (but not the movies as they can be referenced in other lists).
  has_many :movies, through: :bookmarks

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
