# frozen_string_literal: true

module Types
  class RepoType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :url, String
    field :name_reversed, String, null: false
    field :categories, [CategoryType], null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def name_reversed
      # “object method allows us to access the object that the RepoType is resolving.”
      object.name.reverse
    end
  end
end
