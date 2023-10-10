class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :address, presence: true

  has_many :post_disaster_ships
  has_many :disasters, through: :post_disaster_ships
  has_many :comments

  belongs_to :user
  mount_uploader :image, ImageUploader

  scope :ordered_by_comments_count, -> {
    left_joins(:comments)
      .group(:id)
      .order('COUNT(comments.id) DESC')
      .select('posts.*, COUNT(comments.id) as comments_count')
  }
  scope :top_posts, -> { left_joins(:comments).group(:id).order('COUNT(comments.id) DESC').limit(3) }
end
