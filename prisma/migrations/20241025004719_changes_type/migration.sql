/*
  Warnings:

  - Changed the type of `total_price` on the `order` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "order" DROP COLUMN "total_price",
ADD COLUMN     "total_price" DOUBLE PRECISION NOT NULL;
