-- AlterTable
ALTER TABLE "notification" ADD COLUMN     "viewed" BOOLEAN NOT NULL DEFAULT false,
ALTER COLUMN "metadata" DROP NOT NULL;

-- AlterTable
ALTER TABLE "notification_click_channels" ALTER COLUMN "updated_at" DROP NOT NULL;

-- AlterTable
ALTER TABLE "public_notification" ADD COLUMN     "viewed_by" TEXT[],
ALTER COLUMN "metadata" DROP NOT NULL,
ALTER COLUMN "created_at" DROP NOT NULL,
ALTER COLUMN "updated_at" DROP NOT NULL;
