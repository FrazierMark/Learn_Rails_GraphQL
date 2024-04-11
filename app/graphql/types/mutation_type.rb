# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject

    # to resolve the add_review field, it will use Mutations::Reviews::Add
    # defined in app/graphql/mutations/reviews/add.rb
    field :add_review, mutation: Mutations::Reviews::Add
    field :update_review, mutation: Mutations::Reviews::Update
    field :delete_review, mutation: Mutations::Reviews::Delete
    field :add_category, mutation: Mutations::Categories::Add
  end
end
