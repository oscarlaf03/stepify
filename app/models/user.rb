class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_create :send_welcome_email
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :steplists
  has_many :visualizations
  has_many :visualized_steps, through: :visualizations, source: :step
  validates :first_name, :last_name, presence: true

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end
end
