class Post < ApplicationRecord
  belongs_to :user
  
  validates :text, presence: true, unless: :image?
  validates :image, presence: true,unless: :text?
  mount_uploader :image, ImageUploader
end
