class Message < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  default_scope -> { order(:created_at) }
  after_commit { MessageBroadcastJob.perform_later self }
end
