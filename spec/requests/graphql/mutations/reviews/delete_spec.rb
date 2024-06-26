require 'rails_helper'

RSpec.describe "GraphQL, deleteReview mutation" do
  let!(:repo) { Repo.create!(name: "Repo Hero", url: "https://github.com/repohero/repohero") }
  let!(:review) { repo.reviews.create!(comment: "Spammy spam spam spam", rating: 1) }

  it "deletes an existing review" do
    query = <<~QUERY
    mutation ($id: ID!) {
      deleteReview(input: { reviewId: $id }) {
        id
      }
    }
    QUERY

    post "/graphql", params: { query: query,
      variables: {
        id: repo.id,
      }
    }

    expect(response.parsed_body).not_to have_errors
    expect(response.parsed_body["data"]).to eq(
      "deleteReview" => {
        "id" => review.id.to_s,
      }
    )
  end
end
