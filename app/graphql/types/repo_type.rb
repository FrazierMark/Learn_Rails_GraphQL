# frozen_string_literal: true

module Types
  class RepoType < Types::BaseObject

    field :id, ID, null: false
    field :name, String
    field :url, String
    field :name_reversed, String, null: false
    field :categories, [CategoryType], null: false

    # connection_type allows us to paginate the results of a query
    # connection is a GraphQL object that represents the link between two objects
    field :reviews, ReviewType.connection_type, null: false, default_page_size: 20, max_page_size: 50
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :activities, ActivityType.connection_type, null: false, default_page_size: 20, max_page_size: 50


    def name_reversed
      # “object method allows us to access the object that the RepoType is resolving.”
      object.name.reverse
    end
  end
end
