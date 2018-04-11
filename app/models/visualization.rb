class Visualization < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :step
end
