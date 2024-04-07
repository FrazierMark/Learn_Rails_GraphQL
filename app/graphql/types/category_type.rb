module Types

  # class defines the behavior of objects resolved with the CategoryType class
  class CategoryType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :repos, [RepoType], null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
