class Comment < ActiveRecord::Base
  validates :body, :user_id, :commentable_id, :commentable_type, :presence => true

  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :votable

  include ActionView::Helpers::DateHelper
end
