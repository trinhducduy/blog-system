class Entry < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, length: {minimum: 6}
  validates :published_date, presence: true
  validates :body, presence: true, length: {minimum: 255}
  validate :published_date_cannot_be_in_the_past

  def published_date_cannot_be_in_the_past
    if published_date.present? && published_date < Date.today
      errors.add(:published_date, "cannot be in the past")
    end
  end
end
