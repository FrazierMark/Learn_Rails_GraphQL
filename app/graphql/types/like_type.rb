# frozen_string_literal: true

# Type used to represent likes that are returned from resolving activity events in our API
module Types
  class LikeType < Types::BaseObject
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
