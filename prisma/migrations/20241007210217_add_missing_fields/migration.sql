/*
  Warnings:

  - You are about to drop the column `stockQuantity` on the `Product` table. All the data in the column will be lost.
  - Added the required column `image_url` to the `Product` table without a default value. This is not possible if the table is not empty.
  - Added the required column `stock_quantity` to the `Product` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Product" DROP COLUMN "stockQuantity",
ADD COLUMN     "customerId" INTEGER,
ADD COLUMN     "image_url" VARCHAR(100) NOT NULL,
ADD COLUMN     "is_active" BOOLEAN DEFAULT false,
ADD COLUMN     "is_deleted" BOOLEAN DEFAULT false,
ADD COLUMN     "stock_quantity" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "customers"("id") ON DELETE SET NULL ON UPDATE CASCADE;
