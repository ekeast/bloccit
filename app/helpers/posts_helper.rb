module PostsHelper

  def render_title(post)
    output = "<h1>#{post.filtered_title}</h1>".html_safe
  end
end
