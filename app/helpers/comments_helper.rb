module CommentsHelper
  def post_date(comment)
    comment.created_at.in_time_zone('Eastern Time (US & Canada)').strftime(
      "%b %e, %Y %l:%M %p")
  end
end
