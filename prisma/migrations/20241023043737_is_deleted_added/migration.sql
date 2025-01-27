-- AlterTable
ALTER TABLE "product_image" ADD COLUMN     "is_deleted" BOOLEAN NOT NULL DEFAULT false;

-- AlterTable
ALTER TABLE "product_segmentation" ADD COLUMN     "is_deleted" BOOLEAN NOT NULL DEFAULT false;
