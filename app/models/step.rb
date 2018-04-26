class Step < ApplicationRecord
  include PgSearch
  multisearchable against: [:title, :description]

  belongs_to :steplist
  has_many :visualizations, dependent: :destroy
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos

  # For active admin naming
  def name
    "#{id}-#{title} at steplist: #{self.steplist.title}"
  end
end
