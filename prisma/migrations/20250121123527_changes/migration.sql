/*
  Warnings:

  - You are about to drop the column `userId` on the `notification_settings` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[user_id]` on the table `notification_settings` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `user_id` to the `notification_settings` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "notification_settings" DROP CONSTRAINT "notification_settings_userId_fkey";

-- DropIndex
DROP INDEX "notification_settings_userId_key";

-- AlterTable
ALTER TABLE "notification_settings" DROP COLUMN "userId",
ADD COLUMN     "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3),
ADD COLUMN     "user_id" VARCHAR(50) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "notification_settings_user_id_key" ON "notification_settings"("user_id");

-- AddForeignKey
ALTER TABLE "notification_settings" ADD CONSTRAINT "notification_settings_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
