class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  belongs_to :user
  scope :visible_to, ->(user) { user ? scoped : where(public: true) }
end