-- CreateEnum
CREATE TYPE "notification_type" AS ENUM ('LIKED_PRODUCT', 'LIKED_COMMENT', 'FAVORITED_COMMENT', 'REPLIED', 'AFFILIATE_PAID_SUBSCRIPTION', 'NEWS_AND_UPDATES', 'TIPS_AND_TUTORIALS');

-- CreateTable
CREATE TABLE "notification" (
    "id" VARCHAR(50) NOT NULL,
    "source_user_id" VARCHAR(50) NOT NULL,
    "resource_id" VARCHAR(50) NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "type" "notification_type" NOT NULL,
    "url_path" VARCHAR(50) NOT NULL,
    "read" BOOLEAN NOT NULL DEFAULT false,
    "trash" BOOLEAN NOT NULL DEFAULT false,
    "read_at" TIMESTAMP(3),
    "url_is_external" BOOLEAN NOT NULL DEFAULT false,
    "metadata" JSONB NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "notification_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public_notification" (
    "id" VARCHAR(50) NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "type" "notification_type" NOT NULL,
    "url_path" VARCHAR(50) NOT NULL,
    "read_by" TEXT[],
    "trash_by" TEXT[],
    "url_is_external" BOOLEAN NOT NULL DEFAULT false,
    "metadata" JSONB NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "public_notification_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "notification_dispatch_channels" (
    "id" VARCHAR(50) NOT NULL,
    "notification_id" VARCHAR(255),
    "public_notification_id" VARCHAR(255),
    "email" BOOLEAN NOT NULL DEFAULT false,
    "sms" BOOLEAN NOT NULL DEFAULT false,
    "push" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "notification_dispatch_channels_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "notification_click_channels" (
    "id" VARCHAR(50) NOT NULL,
    "notification_id" VARCHAR(255),
    "public_notification_id" VARCHAR(255),
    "email" BOOLEAN NOT NULL DEFAULT false,
    "push" BOOLEAN NOT NULL DEFAULT false,
    "email_click_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "push_click_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "notification_click_channels_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "notification" ADD CONSTRAINT "notification_source_user_id_fkey" FOREIGN KEY ("source_user_id") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "notification_dispatch_channels" ADD CONSTRAINT "notification_dispatch_channels_notification_id_fkey" FOREIGN KEY ("notification_id") REFERENCES "notification"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "notification_dispatch_channels" ADD CONSTRAINT "notification_dispatch_channels_public_notification_id_fkey" FOREIGN KEY ("public_notification_id") REFERENCES "public_notification"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "notification_click_channels" ADD CONSTRAINT "notification_click_channels_notification_id_fkey" FOREIGN KEY ("notification_id") REFERENCES "notification"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "notification_click_channels" ADD CONSTRAINT "notification_click_channels_public_notification_id_fkey" FOREIGN KEY ("public_notification_id") REFERENCES "public_notification"("id") ON DELETE SET NULL ON UPDATE CASCADE;
