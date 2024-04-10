# frozen_string_literal: true

module Types
  class ActivityType < Types::BaseObject
    # Our union type, used to render either a review or a like
    field :event, EventType, null: false
  end
end
