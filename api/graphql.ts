import { ApolloServer } from "apollo-server-micro";
import { makeExecutableSchema } from 'graphql-tools';
import Cors from 'micro-cors'
import { typeDefs } from '../utils/api/typeDefs'
import { resolvers } from '../utils/api/resolvers'
const schema = makeExecutableSchema({
  typeDefs, resolvers
})

export const config = {
  api: { bodyParser: true }
}

const cors = Cors();

const handler = new ApolloServer({
  schema
}).createHandler({
  path: '/api/graphql'
})

export default cors((req, res) => {

  if (req.method === 'options') {
    return res.status(200).send()
  }
  return handler(req, res)
})


// export default handler;