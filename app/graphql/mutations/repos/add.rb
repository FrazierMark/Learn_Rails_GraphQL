module Mutations
  module Repos
    class Add < BaseMutation
      graphql_name 'AddRepo'
      type Types::RepoType, null: false

      argument :name, String, required: true
      argument :url, String, required: true

      def resolve(**args )
        Repo.create!(args)
      end
    end
  end
end
