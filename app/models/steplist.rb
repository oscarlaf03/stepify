class Steplist < ApplicationRecord
  Gutentag::ActiveRecord.call self

  attr_accessor :info_tag
  belongs_to :user
  belongs_to :organization, optional: true
  has_many :steps, dependent: :destroy
  has_many :pins
  has_many :users, through: :pins
  validates :title, presence: true
  validates :user, presence: true
  validates :user_tags, format: { with: /(#+|^$)/, message: "Include a '#' on your tags"}
  after_create :add_tags
  around_update :update_tags

  private

  def add_tags
    if user_tags.present?
      user_tags.split('#').each do |tag|
        tag_names << tag.strip.downcase
        save
      end
    end
  end

  def update_tags
    if user_tags.present?
      user_tags.split('#').each do |tag|
        tag_names << tag.strip.downcase
      end
    end
  end
end
