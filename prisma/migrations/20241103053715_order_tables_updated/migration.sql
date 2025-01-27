/*
  Warnings:

  - Added the required column `paid_amount` to the `order` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "discount_type" AS ENUM ('Percentage', 'Fixed');

-- AlterTable
ALTER TABLE "order" ADD COLUMN     "delivery_fee" MONEY,
ADD COLUMN     "notes" TEXT,
ADD COLUMN     "paid_amount" MONEY NOT NULL;

-- CreateTable
CREATE TABLE "order_discount" (
    "id" VARCHAR(50) NOT NULL,
    "order_id" TEXT NOT NULL,
    "type" "discount_type" NOT NULL,
    "reason" TEXT,
    "amount" DOUBLE PRECISION NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "order_discount_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "order_item_discount" (
    "id" VARCHAR(50) NOT NULL,
    "order_item_id" TEXT NOT NULL,
    "type" "discount_type" NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "reason" TEXT,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "order_item_discount_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "order_discount_order_id_key" ON "order_discount"("order_id");

-- CreateIndex
CREATE UNIQUE INDEX "order_item_discount_order_item_id_key" ON "order_item_discount"("order_item_id");

-- AddForeignKey
ALTER TABLE "order_discount" ADD CONSTRAINT "order_discount_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "order"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order_item_discount" ADD CONSTRAINT "order_item_discount_order_item_id_fkey" FOREIGN KEY ("order_item_id") REFERENCES "item"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
