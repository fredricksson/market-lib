-- AlterTable
ALTER TABLE "payment" ADD COLUMN     "updated_at" TIMESTAMP(3),
ALTER COLUMN "created_at" DROP NOT NULL;

-- AlterTable
ALTER TABLE "subscription" ALTER COLUMN "created_at" DROP NOT NULL,
ALTER COLUMN "updated_at" DROP NOT NULL;

-- AlterTable
ALTER TABLE "subscription_plan" ALTER COLUMN "created_at" DROP NOT NULL,
ALTER COLUMN "updated_at" DROP NOT NULL;
