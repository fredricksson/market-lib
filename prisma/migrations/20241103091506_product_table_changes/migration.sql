/*
  Warnings:

  - You are about to drop the column `unit_purchase_price` on the `product` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "product" DROP COLUMN "unit_purchase_price",
ADD COLUMN     "available_to_order" BOOLEAN NOT NULL DEFAULT false;
