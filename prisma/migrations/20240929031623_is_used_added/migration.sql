/*
  Warnings:

  - You are about to drop the column `isExpired` on the `userConfirmation` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "userConfirmation" DROP COLUMN "isExpired",
ADD COLUMN     "is_used" BOOLEAN NOT NULL DEFAULT false;
