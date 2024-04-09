# frozen_string_literal: true

# BaseUnion class includes possible_types method
# used to define the types that can be returned from this union
# (either ReviewType or LikeType in this case)
module Types
  class EventType < Types::BaseUnion
    possible_types ReviewType, LikeType

    def self.resolve_type(object, context)
      case object
      when Review
        ReviewType
      when Like
        LikeType
      end
    end
  end
end
