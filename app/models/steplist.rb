class Steplist < ApplicationRecord
  Gutentag::ActiveRecord.call self

  belongs_to :user
  belongs_to :organization, optional: true
  has_many :steps, dependent: :destroy
  has_many :pins
  has_many :users, through: :pins
  validates :title, presence: true
  validates :user, presence: true
end
