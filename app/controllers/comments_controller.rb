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

  only_logged :edit
  def edit
    @comment = Comment.find(params[:id])
    return not_found unless @comment
    return forbidden unless @comment.can_edit?(current_user)
  end

  only_logged :update
  def update
    @comment = Comment.find(params[:id])
    return not_found unless @comment
    return forbidden unless @comment.can_edit?(current_user)

    @comment.attributes = params[:comment]
    if @comment.save
      flash[:notice] = I18n.t("comments.update.success")
      redirect_to @comment.commentable
    else
      render :edit
    end
  end

  only_logged :destroy
  def destroy
    @comment = Comment.find(params[:id])
    return not_found unless @comment
    return forbidden unless @comment.can_destroy?(current_user)

    redirect_to @comment.commentable
    @comment.destroy

  end
end
