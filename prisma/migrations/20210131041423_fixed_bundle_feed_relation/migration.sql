/*
  Warnings:

  - You are about to drop the column `userId` on the `Feed` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Feed" DROP CONSTRAINT "Feed_userId_fkey";

-- AlterTable
ALTER TABLE "Bundle" ALTER COLUMN "description" SET DEFAULT E'';

-- AlterTable
ALTER TABLE "Feed" DROP COLUMN "userId";

-- CreateTable
CREATE TABLE "_BundleToFeed" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_BundleToFeed_AB_unique" ON "_BundleToFeed"("A", "B");

-- CreateIndex
CREATE INDEX "_BundleToFeed_B_index" ON "_BundleToFeed"("B");

-- AddForeignKey
ALTER TABLE "_BundleToFeed" ADD FOREIGN KEY ("A") REFERENCES "Bundle"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BundleToFeed" ADD FOREIGN KEY ("B") REFERENCES "Feed"("id") ON DELETE CASCADE ON UPDATE CASCADE;
