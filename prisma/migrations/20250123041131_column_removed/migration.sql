/*
  Warnings:

  - You are about to drop the column `destination_user_id` on the `notification` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "notification" DROP CONSTRAINT "notification_destination_user_id_fkey";

-- AlterTable
ALTER TABLE "notification" DROP COLUMN "destination_user_id";
