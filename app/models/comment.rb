class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, :polymorphic => true

  validates :content, :presence => true, :length => { :maximum => 4096 }
  validates :user, :presence => true
end
