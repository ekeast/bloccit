class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  def filtered_title
    id % 5 == 0 || id == 0 ? "SPAM" : title
  end
end
