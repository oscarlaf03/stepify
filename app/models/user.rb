class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :user_photo, UserPhotoUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :steplists
  has_many :steps, through: :steplists
  has_many :visualizations
  has_many :visualized_steps, through: :visualizations, source: :step
  has_many :organization_users
  has_many :organizations, through: :organization_users
  has_many :pins
  has_many :steplists, through: :pins, as: :pinned_steplists
  validates :first_name, :last_name, presence: true

  def pinned?(steplist)
    Pin.where(user: self, steplist: steplist).present?
  end

  def pin(steplist)
    Pin.where(user: self, steplist: steplist).first
  end

  private
end
