class Log::Post < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 100 }
  validates :body,  presence: true

  has_many :comments
  belongs_to :user
end
