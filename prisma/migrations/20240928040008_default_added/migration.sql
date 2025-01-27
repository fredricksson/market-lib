/*
  Warnings:

  - You are about to drop the column `expiresIn` on the `userConfirmation` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "userConfirmation" DROP COLUMN "expiresIn",
ADD COLUMN     "expires_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;
