/*
  Warnings:

  - The primary key for the `userConfirmation` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `userConfirmation` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - Added the required column `code` to the `userConfirmation` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "userConfirmation" DROP CONSTRAINT "userConfirmation_pkey",
ADD COLUMN     "code" INTEGER NOT NULL,
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "userConfirmation_pkey" PRIMARY KEY ("id");
