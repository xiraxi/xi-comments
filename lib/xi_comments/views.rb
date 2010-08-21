module CommentsHelper

  def comments_for(commentable, options = {})
    content_tag :div, :class => "comments" do
      concat render(:partial => "comments/comment", :collection => commentable.comments)

      if options[:new_comments] != false
        if current_user.nil?
          concat content_tag("p", t("comments.creation.required_user"), :class => "login_error")
        else
          concat render(:partial => "comments/new", :locals => { :commentable => commentable })
        end
      end
    end
  end

end

ActionView::Base.class_eval do
  include CommentsHelper
end
