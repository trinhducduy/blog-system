class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :entry
  has_many :children, class_name: 'Comment', 
                      foreign_key: 'parent_id',
                      dependent: :destroy
  belongs_to :parent, class_name: 'Comment'

  validates :content, presence: true

  def posted_by? user
    self.user == user
  end
end
