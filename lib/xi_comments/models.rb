
module ModelHasComments

  def self.included(cls)
    cls.extend ClassMethods
  end

  module ClassMethods
    def has_comments
      has_many :comments, :order => 'created_at', :as => 'commentable'
    end
  end


  def can_comment?(user)
    user and user.confirmed?
  end

end

# TODO Include mixin in ActiveModel
ActiveRecord::Base.class_eval do
  include ModelHasComments
end
