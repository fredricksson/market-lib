/*
  Warnings:

  - Added the required column `destination_user_id` to the `notification` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "notification" DROP CONSTRAINT "notification_source_user_id_fkey";

-- AlterTable
ALTER TABLE "notification" ADD COLUMN     "destination_user_id" VARCHAR(50) NOT NULL,
ALTER COLUMN "source_user_id" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "notification" ADD CONSTRAINT "notification_destination_user_id_fkey" FOREIGN KEY ("destination_user_id") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
