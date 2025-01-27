/*
  Warnings:

  - A unique constraint covering the columns `[affiliate_link]` on the table `user` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "user" ADD COLUMN     "affiliate_link" TEXT,
ADD COLUMN     "is_affiliate" BOOLEAN NOT NULL DEFAULT false;

-- CreateTable
CREATE TABLE "referred" (
    "id" VARCHAR(50) NOT NULL,
    "affiliate_id" VARCHAR(50) NOT NULL,
    "referred_user_id" VARCHAR(50) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "referred_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_affiliate_link_key" ON "user"("affiliate_link");

-- AddForeignKey
ALTER TABLE "referred" ADD CONSTRAINT "referred_affiliate_id_fkey" FOREIGN KEY ("affiliate_id") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "referred" ADD CONSTRAINT "referred_referred_user_id_fkey" FOREIGN KEY ("referred_user_id") REFERENCES "customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
