class Organization < ApplicationRecord
  has_many :steplists
  validates :company_name, :web_site, presence: true
  validates :company_name, uniqueness: true
  mount_uploader :logo, ImageUploader
  mount_uploader :image_banner, ImageUploader
  has_many :users, through: :organization_users
end
