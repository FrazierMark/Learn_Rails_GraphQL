# frozen_string_literal: true

module Types
  # Type used to represent the likes that are returned from resolving activity events in our API
  class LikeType < Types::BaseObject
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
