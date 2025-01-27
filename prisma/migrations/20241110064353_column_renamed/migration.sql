/*
  Warnings:

  - You are about to drop the column `phone_number_is_confirmed` on the `user` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "user" DROP COLUMN "phone_number_is_confirmed",
ADD COLUMN     "is_phone_number_confirmed" BOOLEAN NOT NULL DEFAULT false;
