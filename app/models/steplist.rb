class Steplist < ApplicationRecord
  belongs_to :user
  belongs_to :organization, optional: true
  has_many :steps, dependent: :destroy
  validates :title, presence: true
  validates :user, presence: true
end
