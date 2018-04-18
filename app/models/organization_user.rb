class OrganizationUser < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  attr_accessor :user_email

end
