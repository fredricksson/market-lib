/*
  Warnings:

  - A unique constraint covering the columns `[subscription_id]` on the table `payment` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "payment" DROP CONSTRAINT "payment_subscription_id_fkey";

-- AlterTable
ALTER TABLE "payment" ALTER COLUMN "subscription_id" SET DATA TYPE TEXT;

-- CreateIndex
CREATE UNIQUE INDEX "payment_subscription_id_key" ON "payment"("subscription_id");

-- AddForeignKey
ALTER TABLE "payment" ADD CONSTRAINT "payment_subscription_id_fkey" FOREIGN KEY ("subscription_id") REFERENCES "subscription"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
