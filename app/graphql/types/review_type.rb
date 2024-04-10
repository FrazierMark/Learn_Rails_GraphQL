# frozen_string_literal: true

module Types
  class ReviewType < Types::BaseObject
    field :id, ID, null: false
    field :rating, Integer, null: false
    field :comment, String, null: false
  end
end
