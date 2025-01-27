/*
  Warnings:

  - You are about to drop the column `resource_id` on the `notification` table. All the data in the column will be lost.
  - You are about to drop the column `source_user_id` on the `notification` table. All the data in the column will be lost.
  - You are about to drop the column `type` on the `notification` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "notification" DROP COLUMN "resource_id",
DROP COLUMN "source_user_id",
DROP COLUMN "type",
ADD COLUMN     "comment_id" VARCHAR(50),
ADD COLUMN     "like_id" VARCHAR(50),
ADD COLUMN     "product_id" VARCHAR(50),
ADD COLUMN     "userId" VARCHAR(50);

-- AddForeignKey
ALTER TABLE "notification" ADD CONSTRAINT "notification_comment_id_fkey" FOREIGN KEY ("comment_id") REFERENCES "comment"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "notification" ADD CONSTRAINT "notification_like_id_fkey" FOREIGN KEY ("like_id") REFERENCES "like"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "notification" ADD CONSTRAINT "notification_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "product"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "notification" ADD CONSTRAINT "notification_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;
