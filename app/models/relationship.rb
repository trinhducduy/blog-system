class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'
  validates :follower_id, presence: true
  validates :followed_id, presence: true
  validate :user_cannot_follow_himself

  def user_cannot_follow_himself
    if follower_id == followed_id
      errors.add(:base, "You cannot follow yourself")
    end
  end
end
