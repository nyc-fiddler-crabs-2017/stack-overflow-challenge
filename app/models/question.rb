class Question < ActiveRecord::Base
  validates :title, :body, :user_id, :presence => true

  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  belongs_to :best_answer, class_name: "Answer"

  include ActionView::Helpers::DateHelper
end
