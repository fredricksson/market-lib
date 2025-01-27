-- AlterTable
ALTER TABLE "category" ADD COLUMN     "image_url" VARCHAR(255),
ADD COLUMN     "parent_id" VARCHAR(50);

-- AddForeignKey
ALTER TABLE "category" ADD CONSTRAINT "category_parent_id_fkey" FOREIGN KEY ("parent_id") REFERENCES "category"("id") ON DELETE SET NULL ON UPDATE CASCADE;
