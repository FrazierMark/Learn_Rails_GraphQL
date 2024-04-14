module Types
  class ValidationErrorType < Types::BaseObject

    class Errors < Types::BaseObject
      field :full_messages, [String], null: false
      field :attribute_errors, [Types::ValidationErrorType::AttributeError], null: false
    end

    field :errors, Types::ValidationErrorType::Errors, null: false
  end
end
