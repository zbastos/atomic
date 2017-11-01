class Partner < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 75 }
  validates :benefits, presence: true
  has_attached_file :logo, default_url: "partner_default.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
end
