class Article < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: { maximum: 100 }
  validates :body,  presence: true

  has_attached_file :image, styles: { medium: "300x300>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
