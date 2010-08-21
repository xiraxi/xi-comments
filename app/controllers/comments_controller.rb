class CommentsController < ApplicationController

  only_logged :create
  def create
    commentable_spec = XiraxiCore::Security.decrypt(params[:commentable])
    return not_found unless commentable_spec

    commentable = commentable_spec[:class].constantize.find(commentable_spec[:id])
    if commentable.can_comment?(current_user)
      comment = commentable.comments.build
      comment.content = params[:comment][:content]
      comment.user = current_user
      if comment.save
        flash[:notice] = I18n.t("comments.creation.success")
      else
        flash[:notice] = I18n.t("comments.creation.invalid", :messages => comment.errors.full_messages)
      end

      redirect_to commentable
    else
      forbidden
    end
  end

end
