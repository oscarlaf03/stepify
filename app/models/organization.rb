class Organization < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :steplists
  validates :company_name, :web_site, presence: true
  validates :company_name, uniqueness: true
  mount_uploader :logo, ImageUploader
  mount_uploader :image_banner, ImageUploader
end
