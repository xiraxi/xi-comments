class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, :polymorphic => true

  attr_accessible :content

  validates :content, :presence => true, :length => { :maximum => 4096 }
  validates :user, :presence => true

  def can_edit?(session_user)
    session_user == user and created_at >= 30.minutes.ago
  end

  def can_destroy?(session_user)
    can_edit?(session_user) or (session_user and session_user.admin?)
  end
end
