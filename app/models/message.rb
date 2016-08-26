class Message < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  default_scope -> { order(:created_at) }
  after_commit { MessageBroadcastJob.perform_later self }

  # Returns a list of users @mentioned in message content.
  def mentions
    content.scan(/@(#{User::NAME_REGEX})/).flatten.map do |username|
      User.find_by(username: username)
    end.compact
  end
end
