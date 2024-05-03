class Follow < ApplicationRecord
  belongs_to :follower, foreign_key: 'follower_id', class_name: 'User'
  belongs_to :following, foreign_key: 'following_id', class_name: 'User'

  validate :different_follower_and_following

  private

  def different_follower_and_following
    if follower_id == following_id
      errors.add(:base, "Follower and Following can't be the same")
    end
  end
end
