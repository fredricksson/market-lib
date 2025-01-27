/*
  Warnings:

  - The `purchase_price` column on the `product` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `unit_purchase_price` column on the `product` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - Changed the type of `unit_price` on the `item` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Added the required column `unit_purchase_price` to the `item` table without a default value. This is not possible if the table is not empty.
  - Changed the type of `total_price` on the `order` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `price` on the `product` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "item" DROP COLUMN "unit_price",
ADD COLUMN     "unit_price" MONEY NOT NULL,
DROP COLUMN "unit_purchase_price",
ADD COLUMN     "unit_purchase_price" MONEY NOT NULL;

-- AlterTable
ALTER TABLE "order" DROP COLUMN "total_price",
ADD COLUMN     "total_price" MONEY NOT NULL;

-- AlterTable
ALTER TABLE "product" DROP COLUMN "price",
ADD COLUMN     "price" MONEY NOT NULL,
DROP COLUMN "purchase_price",
ADD COLUMN     "purchase_price" MONEY,
DROP COLUMN "unit_purchase_price",
ADD COLUMN     "unit_purchase_price" MONEY;
