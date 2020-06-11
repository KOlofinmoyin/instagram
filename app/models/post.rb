class Post < ApplicationRecord
  validates :image, presence: true
  validates :caption, presence: true, length: { minimum: 5 }
  
  has_attached_file :image, styles: { :medium => "640x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
