/*
  Warnings:

  - Made the column `updatedAt` on table `Product` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "Product" ALTER COLUMN "updatedAt" SET NOT NULL;

-- AlterTable
ALTER TABLE "categories" ADD COLUMN     "type" VARCHAR(60);
