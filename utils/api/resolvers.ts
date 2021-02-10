import { Prisma } from "@prisma/client";

export const resolvers = {
  Query: {
    hello: (parent, args, context) => 'hi!',
    feed: (parent, { data: { id } }, { prisma }) => prisma.feed.findUnique(id)
};

}