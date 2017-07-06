module CommentsHelper
  def post_date(comment)
    comment.created_at.in_time_zone('Eastern Time (US & Canada)').strftime(
      "%b %e, %Y %l:%M %p")
  end

  def delete_comment_link(comment)
    if policy(comment).destroy?
      link_to "delete",
        project_request_comment_path(comment.request.project, comment.request, comment),
        method: :delete,
        class: "small-link float-right"
    end
  end

  def comment_color(comment)
    if comment.user && comment.user.client?
      "li-comment-client"
    else
      "li-comment"
    end
  end

end
