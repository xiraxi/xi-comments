module CommentsHelper

  def comments_for(commentable, options = {})
    content_tag :div, :class => "comments" do
      concat content_tag(:h2, t("comments.show.header"))

      all_comments = commentable.comments
      concat %[<div class="comment"><a href="#comments" name="comments" class="button">#{t "comments.show.links.new"}</a></div>\n].html_safe
      concat %[<div class="comments-count">#{t "comments.show.count", :count => all_comments.size}</div>\n].html_safe
      concat render(:partial => "comments/comment", :collection => all_comments)

      unless options[:new_comments] == false
        if current_user.nil?
          concat %[<div class="anonymous"><p>#{t("comments.creation.required_user")}</p></div>].html_safe
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
