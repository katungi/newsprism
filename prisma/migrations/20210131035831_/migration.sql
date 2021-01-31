-- CreateTable
CREATE TABLE "Feed" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "authorId" TEXT,
    "userId" TEXT,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Bundle" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "authorId" TEXT,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "auth0" TEXT NOT NULL,
    "nickname" TEXT,
    "picture" TEXT,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SavedArticle" (
    "id" TEXT NOT NULL,
    "content" JSONB NOT NULL,
    "feedId" TEXT,
    "authorId" TEXT,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BundleTag" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "bundleId" TEXT,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Feedtag" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_FeedToFeedtag" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_FeedUserLikes" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_BundleUserLikes" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Feed.url_unique" ON "Feed"("url");

-- CreateIndex
CREATE UNIQUE INDEX "User.auth0_unique" ON "User"("auth0");

-- CreateIndex
CREATE UNIQUE INDEX "BundleTag.name_unique" ON "BundleTag"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Feedtag.name_unique" ON "Feedtag"("name");

-- CreateIndex
CREATE UNIQUE INDEX "_FeedToFeedtag_AB_unique" ON "_FeedToFeedtag"("A", "B");

-- CreateIndex
CREATE INDEX "_FeedToFeedtag_B_index" ON "_FeedToFeedtag"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_FeedUserLikes_AB_unique" ON "_FeedUserLikes"("A", "B");

-- CreateIndex
CREATE INDEX "_FeedUserLikes_B_index" ON "_FeedUserLikes"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_BundleUserLikes_AB_unique" ON "_BundleUserLikes"("A", "B");

-- CreateIndex
CREATE INDEX "_BundleUserLikes_B_index" ON "_BundleUserLikes"("B");

-- AddForeignKey
ALTER TABLE "Feed" ADD FOREIGN KEY ("authorId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Feed" ADD FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Bundle" ADD FOREIGN KEY ("authorId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SavedArticle" ADD FOREIGN KEY ("feedId") REFERENCES "Feed"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SavedArticle" ADD FOREIGN KEY ("authorId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BundleTag" ADD FOREIGN KEY ("bundleId") REFERENCES "Bundle"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FeedToFeedtag" ADD FOREIGN KEY ("A") REFERENCES "Feed"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FeedToFeedtag" ADD FOREIGN KEY ("B") REFERENCES "Feedtag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FeedUserLikes" ADD FOREIGN KEY ("A") REFERENCES "Feed"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FeedUserLikes" ADD FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BundleUserLikes" ADD FOREIGN KEY ("A") REFERENCES "Bundle"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BundleUserLikes" ADD FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
