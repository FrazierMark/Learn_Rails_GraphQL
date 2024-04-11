module Mutations
  module Reviews
    class Add < BaseMutation
      graphql_name 'AddReview'

      # return type of the mutation
      type Types::ReviewType, null: false

      argument :repo_id, ID, required: true
      argument :rating, String, required: true
      argument :comment, String, required: true

      # define how to resolve this mutation
      def resolve(repo_id:, rating:, comment:)
        Review.create!(
          repo_id: repo_id,
          rating: rating,
          comment: comment,
        )
      end
    end
  end
end
