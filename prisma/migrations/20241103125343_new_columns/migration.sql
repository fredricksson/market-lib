/*
  Warnings:

  - Added the required column `sub_total` to the `order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `total` to the `order` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "order" ADD COLUMN     "sub_total" MONEY NOT NULL,
ADD COLUMN     "total" MONEY NOT NULL;

-- AlterTable
ALTER TABLE "order_discount" ALTER COLUMN "amount" DROP NOT NULL;

-- AlterTable
ALTER TABLE "order_item_discount" ALTER COLUMN "amount" DROP NOT NULL;
