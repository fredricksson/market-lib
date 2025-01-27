/*
  Warnings:

  - Changed the type of `stock_quantity` on the `product` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "product" DROP COLUMN "stock_quantity",
ADD COLUMN     "stock_quantity" INTEGER NOT NULL;
