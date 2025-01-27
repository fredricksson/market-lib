/*
  Warnings:

  - A unique constraint covering the columns `[reference]` on the table `order` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "order" ADD COLUMN     "reference" TEXT NOT NULL DEFAULT '0cTuQ42';

-- CreateIndex
CREATE UNIQUE INDEX "order_reference_key" ON "order"("reference");
