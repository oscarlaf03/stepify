class Photo < ApplicationRecord
  belongs_to :step
  mount_uploader :image, ImageUploader
end
