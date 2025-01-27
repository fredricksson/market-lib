/*
  Warnings:

  - A unique constraint covering the columns `[name]` on the table `districts` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[name]` on the table `neighborhoods` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[name]` on the table `provinces` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `social_id` to the `business_social_midia` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "business" ADD COLUMN     "location" JSONB,
ADD COLUMN     "operating_hours" JSONB,
ALTER COLUMN "name" DROP NOT NULL,
ALTER COLUMN "image_url" DROP NOT NULL,
ALTER COLUMN "cover" DROP NOT NULL;

-- AlterTable
ALTER TABLE "business_social_midia" ADD COLUMN     "social_id" INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "districts_name_key" ON "districts"("name");

-- CreateIndex
CREATE UNIQUE INDEX "neighborhoods_name_key" ON "neighborhoods"("name");

-- CreateIndex
CREATE UNIQUE INDEX "provinces_name_key" ON "provinces"("name");

-- AddForeignKey
ALTER TABLE "business_social_midia" ADD CONSTRAINT "business_social_midia_social_id_fkey" FOREIGN KEY ("social_id") REFERENCES "social_midias"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
