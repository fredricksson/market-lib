/*
  Warnings:

  - Made the column `name` on table `category` required. This step will fail if there are existing NULL values in that column.
  - Made the column `slug` on table `category` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "category" ALTER COLUMN "name" SET NOT NULL,
ALTER COLUMN "slug" SET NOT NULL;
