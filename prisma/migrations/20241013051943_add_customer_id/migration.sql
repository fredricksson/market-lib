-- AlterTable
ALTER TABLE "Service" ADD COLUMN     "cover_image_url" TEXT,
ADD COLUMN     "customerId" INTEGER;

-- AddForeignKey
ALTER TABLE "Service" ADD CONSTRAINT "Service_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "customers"("id") ON DELETE SET NULL ON UPDATE CASCADE;
