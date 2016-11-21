class Picture < ApplicationRecord

  has_many :comments, dependent: :destroy
  has_attached_file :image
  validates_attachment :image,
                       content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
