class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :organization, optional: true
  has_many :steplists
  has_many :steps, through: :steplists
  has_many :visualizations
  has_many :visualized_steps, through: :visualizations, source: :step
  validates :first_name, :last_name, presence: true

  private
end
