class Steplist < ApplicationRecord
  belongs_to :user
  has_many :steps, dependent: :destroy
  validates :title, presence: true
  validates :user, presennce: true
end
