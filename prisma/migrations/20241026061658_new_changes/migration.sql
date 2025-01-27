-- DropForeignKey
ALTER TABLE "item" DROP CONSTRAINT "item_product_id_fkey";

-- AlterTable
ALTER TABLE "item" ALTER COLUMN "product_id" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "item" ADD CONSTRAINT "item_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "product"("id") ON DELETE SET NULL ON UPDATE CASCADE;
