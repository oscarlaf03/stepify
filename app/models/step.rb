class Step < ApplicationRecord
  belongs_to :steplist
  has_many :visualizations, dependent: :destroy
end
