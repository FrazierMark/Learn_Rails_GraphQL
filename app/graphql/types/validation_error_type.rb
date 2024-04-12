module Types
  class ValidationErrorType < Types::BaseObject

    class Errors < Types::BaseObject
      field :full_messages, [String], mull: false
    end

    field :errors, Types::ValidationErrorType::Errors, null: false
  end
end
