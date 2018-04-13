class Step < ApplicationRecord
  belongs_to :steplist
  has_many :visualizations, dependent: :destroy
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos
end
