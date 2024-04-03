query = <<~QUERY
    query {
      repos {
        name
        url
      }
    }
    QUERY

result = RepoHeroSchema.execute(query)
puts JSON.pretty_generate(result)
