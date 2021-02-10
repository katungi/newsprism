import { gql } from 'apollo-server-micro';

export const typeDefs = gql`
type feed {
  id: String
  name: String
  url: String
}
type bundle {
  id: String
  name: String
  description: String
}
type bundleInput {
  id: String
}
type bundleCreateInput{
  id: String
  name: String
  description: String
}
input feedInput{
  id: String
}
input feedCreateInput {
id: String
url: String
name: String
}
type Query {
    hello: String
    feed(data: feedInput): feed
    feeds: [feed]
  }

  type Mutation {
    createFeed(data: feedCreateInput):feed
  }

`;
