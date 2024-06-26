# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :repo, RepoResultType, null: false do
      argument :id, ID, required: true
    end

    field :repos, [RepoType], null: false
    def repos
      Repo.all
    end

    field :repo, RepoResultType, null: false do
      argument :id, ID, required: true
    end

    # This method takes in the id arg from the field and uses it to resolve an object
    def repo(id:)
      Repo.find_by(id: id) || { message: "Could not find a repository with id='#{id}'" }
    end

    field :category, CategoryType, null: false do
      argument :id, ID, required: true
    end
    def category(id:)
      Category.find(id)
    end

  end
end
