module UsersHelper

  def render_posts_for(user)
    output = "<h2>Posts</h2>"
    if user.posts.any?
      output += render user.posts
    else
      output += "<p>You have not created any posts yet.</p>"
    end
    output.html_safe
  end

  def render_comments_for(user)
    output = "<h2>Comments</h2>"
    if user.comments.any?
      output += render user.comments
    else
      output += "<p>You have not created any comments yet.</p>"
    end
    output.html_safe
  end

  def render_favorites_for(user)
    output = "<h2>Favorite Posts</h2>"
    if user.favorites.any?
      output += render user.favorites.map(&:post)   # creates array of post objects that user has favorited
    else
      output += "<p>You have not favorited any posts yet.</p>"
    end
    output.html_safe
  end

end
