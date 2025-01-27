/*
  Warnings:

  - A unique constraint covering the columns `[value]` on the table `segmentation` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "segmentation_value_key" ON "segmentation"("value");
