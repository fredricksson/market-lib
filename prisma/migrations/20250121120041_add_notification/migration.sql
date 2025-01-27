/*
  Warnings:

  - You are about to drop the column `emailNotificationsId` on the `notification_settings` table. All the data in the column will be lost.
  - You are about to drop the column `pushNotificationsId` on the `notification_settings` table. All the data in the column will be lost.
  - You are about to drop the column `smsNotificationsId` on the `notification_settings` table. All the data in the column will be lost.
  - You are about to drop the `email_notifications` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `push_notifications` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `sms_notifications` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "notification_settings" DROP CONSTRAINT "notification_settings_emailNotificationsId_fkey";

-- DropForeignKey
ALTER TABLE "notification_settings" DROP CONSTRAINT "notification_settings_pushNotificationsId_fkey";

-- DropForeignKey
ALTER TABLE "notification_settings" DROP CONSTRAINT "notification_settings_smsNotificationsId_fkey";

-- AlterTable
ALTER TABLE "notification_settings" DROP COLUMN "emailNotificationsId",
DROP COLUMN "pushNotificationsId",
DROP COLUMN "smsNotificationsId",
ADD COLUMN     "email_likes_and_comments" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "email_news_updates" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "email_reminders" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "email_tips_and_tutorials" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "push_likes_and_comments" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "push_news_updates" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "push_reminders" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "push_tips_and_tutorials" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "sms_likes_and_comments" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "sms_news_updates" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "sms_tips_and_tutorials" BOOLEAN NOT NULL DEFAULT false;

-- DropTable
DROP TABLE "email_notifications";

-- DropTable
DROP TABLE "push_notifications";

-- DropTable
DROP TABLE "sms_notifications";
