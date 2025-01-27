-- AlterTable
ALTER TABLE "view" ADD COLUMN     "affiliate_link" TEXT;

-- AddForeignKey
ALTER TABLE "view" ADD CONSTRAINT "view_affiliate_link_fkey" FOREIGN KEY ("affiliate_link") REFERENCES "user"("affiliate_link") ON DELETE SET NULL ON UPDATE CASCADE;
