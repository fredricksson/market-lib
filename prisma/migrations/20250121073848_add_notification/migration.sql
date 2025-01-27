-- CreateTable
CREATE TABLE "notification_settings" (
    "id" VARCHAR(50) NOT NULL,
    "userId" VARCHAR(50) NOT NULL,
    "emailNotificationsId" TEXT NOT NULL,
    "pushNotificationsId" TEXT NOT NULL,
    "smsNotificationsId" TEXT NOT NULL,

    CONSTRAINT "notification_settings_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "email_notifications" (
    "id" VARCHAR(50) NOT NULL,
    "newsUpdates" BOOLEAN NOT NULL DEFAULT false,
    "tipsAndTutorials" BOOLEAN NOT NULL DEFAULT false,
    "likesAndComments" BOOLEAN NOT NULL DEFAULT false,
    "reminders" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "email_notifications_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "push_notifications" (
    "id" VARCHAR(50) NOT NULL,
    "newsUpdates" BOOLEAN NOT NULL DEFAULT false,
    "tipsAndTutorials" BOOLEAN NOT NULL DEFAULT false,
    "likesAndComments" BOOLEAN NOT NULL DEFAULT false,
    "reminders" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "push_notifications_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sms_notifications" (
    "id" VARCHAR(50) NOT NULL,
    "newsUpdates" BOOLEAN NOT NULL DEFAULT false,
    "tipsAndTutorials" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "sms_notifications_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "notification_settings_userId_key" ON "notification_settings"("userId");

-- AddForeignKey
ALTER TABLE "notification_settings" ADD CONSTRAINT "notification_settings_emailNotificationsId_fkey" FOREIGN KEY ("emailNotificationsId") REFERENCES "email_notifications"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "notification_settings" ADD CONSTRAINT "notification_settings_pushNotificationsId_fkey" FOREIGN KEY ("pushNotificationsId") REFERENCES "push_notifications"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "notification_settings" ADD CONSTRAINT "notification_settings_smsNotificationsId_fkey" FOREIGN KEY ("smsNotificationsId") REFERENCES "sms_notifications"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "notification_settings" ADD CONSTRAINT "notification_settings_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
