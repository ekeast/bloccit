class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :topic

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true

  def filtered_title
    id % 5 == 0 || id == 0 ? "SPAM" : title
  end
end
