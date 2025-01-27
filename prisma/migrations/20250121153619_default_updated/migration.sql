-- AlterTable
ALTER TABLE "notification_settings" ALTER COLUMN "email_likes_and_comments" SET DEFAULT true,
ALTER COLUMN "email_news_updates" SET DEFAULT true,
ALTER COLUMN "email_reminders" SET DEFAULT true,
ALTER COLUMN "email_tips_and_tutorials" SET DEFAULT true;
