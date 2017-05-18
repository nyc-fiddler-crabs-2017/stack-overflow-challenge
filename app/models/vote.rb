class Vote < ActiveRecord::Base
  validates :up_down, :user_id, :votable_id, :votable_type, :presence => true

  belongs_to :user
  belongs_to :votable, polymorphic: true
end
