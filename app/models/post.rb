class Post < ApplicationRecord
  validates :title, presence: true
  validates :short_desc, presence: true
  #validates :content, presence: true
  #validates :published, presence: true

  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
  
end
