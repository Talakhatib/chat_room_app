class Notification < ApplicationRecord
  include Noticed::Model
  belongs_to :recipient, polymorphic: true
  after_create_commit {broadcast_append_to "notifications"}

end
