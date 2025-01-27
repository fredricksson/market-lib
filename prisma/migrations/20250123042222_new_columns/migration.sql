-- AlterTable
ALTER TABLE "notification_dispatch_channels" ADD COLUMN     "email_dispatched" BOOLEAN DEFAULT false,
ADD COLUMN     "push_dispatched" BOOLEAN DEFAULT false,
ADD COLUMN     "sms_dispatched" BOOLEAN DEFAULT false;
