module Mutations
  module Repos
    class Add < BaseMutation
      graphql_name 'AddRepo'
      type Types::RepoType, null: false

      argument :name, String, required: true
      argument :url, String, required: true

      def resolve(name:, url:, category_id:, )
        Repo.create!(
          name: name,
          url: url,
        )
      end
    end
  end
end
