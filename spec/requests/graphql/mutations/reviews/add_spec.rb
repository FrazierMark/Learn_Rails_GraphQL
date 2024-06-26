require 'rails_helper'

RSpec.describe "GraphQL, addReview mutation" do
  let!(:repo) { Repo.create!(name: "Repo Hero", url: "https://github.com/repohero/repohero") }
  let(:query) do
    <<~QUERY
      mutation ($id: ID!, $rating: ReviewRating!, $comment: String!) {
        addReview(input: { repoId: $id, rating: $rating, comment: $comment }) {
          ...on Review {
            id
            rating
          }

          ...on ValidationError {
            errors {
              fullMessages
              attributeErrors {
                attribute
                errors
              }
            }
          }
        }
      }
      QUERY
  end

  it "adds a new review" do
    post "/graphql", params: {
      query: query,
      variables: {
        id: repo.id,
        rating: "FIVE_STARS",
        comment: "What a repo!"
      }
    }

    expect(response.parsed_body).not_to have_errors
    expect(response.parsed_body["data"]).to eq(
      "addReview" => {
        "id" => Review.last.id.to_s,
        "rating" => "FIVE_STARS",
      }
    )
  end

  it "cannot add a review without a comment" do
    post "/graphql", params: {
      query: query,
      variables: {
        id: repo.id,
        rating: "FIVE_STARS",
        comment: ""
      }
    }

    expect(response.parsed_body).not_to have_errors
    expect(response.parsed_body["data"]).to eq(
      "addReview" => {
        "errors" => {
          "fullMessages" => ["Comment can't be blank"],
          "attributeErrors" => [
            {
              "attribute" => "comment",
              "errors" => ["can't be blank"],
            }
          ]
        }
      }
    )
  end
end
