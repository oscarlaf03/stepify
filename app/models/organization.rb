class Organization < ApplicationRecord
  has_many :users
  has_many :steplists
  validates :company_name, :web_site, presence: true
  validates :company_name, uniqueness: true
end
