module PostsHelper

  def render_title(post)
    output = "<h1>#{post.filtered_title}</h1>".html_safe
  end

  def user_is_authorized_for_post?(post)
       current_user && (current_user == post.user || current_user.admin?)
  end
end
