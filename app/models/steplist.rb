class Steplist < ApplicationRecord
  Gutentag::ActiveRecord.call self

  belongs_to :user
  belongs_to :organization, optional: true
  has_many :steps, dependent: :destroy
  has_many :pins, dependent: :destroy
  has_many :users, through: :pins
  validates :title, presence: true
  validates :user, presence: true
  validates :user_tags, format: { with: /(#+|^$)/, message: "Include a '#' on your tags"}

  before_save :add_tags
  before_update :update_tags

  # For Active Admin

  def name
    "#{id}-#{title}by: #{User.find(user_id).first_name}"
  end


  private

  def add_tags
    if user_tags.present?
      user_tags.split('#').each do |tag|
        tag_names << tag.strip.downcase if tag.present?
      end
    end
  end

  def update_tags
    if user_tags.present?
      user_tags.split('#').each do |tag|
        tag_names << tag.strip.downcase if tag.present?
      end
    end
  end
end
