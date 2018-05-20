class Post < ApplicationRecord
  acts_as_votable
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  validates :title, presence: true, uniqueness: true, length: {minimum: 5 }
  
  has_attached_file :image, styles: { medium: "700x600>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
