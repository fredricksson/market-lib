/*
  Warnings:

  - A unique constraint covering the columns `[user_id,product_id,service_id,parent_comment]` on the table `comment` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "comment_user_id_product_id_service_id_key";

-- AlterTable
ALTER TABLE "comment" ADD COLUMN     "parent_comment" TEXT;

-- CreateIndex
CREATE UNIQUE INDEX "comment_user_id_product_id_service_id_parent_comment_key" ON "comment"("user_id", "product_id", "service_id", "parent_comment");

-- AddForeignKey
ALTER TABLE "comment" ADD CONSTRAINT "comment_parent_comment_fkey" FOREIGN KEY ("parent_comment") REFERENCES "comment"("id") ON DELETE SET NULL ON UPDATE CASCADE;
