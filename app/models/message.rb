class Message < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  scope :for_display, -> { order(:created_at).limit(50) }

  # Returns a list of users @mentioned in message content.
  def mentions
    content.scan(/@(#{User::NAME_REGEX})/).flatten.map do |username|
      User.find_by(username: username)
    end.compact
  end
end