class Post < ApplicationRecord
  validates :image, presence: true

  has_attached_file :image, style: { :medium => "640x" }, dependent: :destroy
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
