class Organization < ApplicationRecord
  has_many :steplists
  validates :company_name, :web_site, presence: true
  validates :company_name, uniqueness: true
  validates :logo, presence: true
  mount_uploader :logo, ImageUploader
  mount_uploader :image_banner, ImageUploader
  has_many :organization_users
  has_many :users, through: :organization_users
end
