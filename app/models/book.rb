class Book < ApplicationRecord
  belongs_to :user, inverse_of: :books
  #has_many :notes, dependent: :delete_all, inverse_of: :book
  #before_validation :sanitizer_title

  #validates_associated :notes

  validates :title, presence: true, length: { maximum: 255 }
  validates_uniqueness_of :title, scope: :user_id
end
