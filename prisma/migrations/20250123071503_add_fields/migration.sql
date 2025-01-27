-- AlterTable
ALTER TABLE "subscription" ADD COLUMN     "is_trial" BOOLEAN DEFAULT false;

-- AlterTable
ALTER TABLE "subscription_plan" ADD COLUMN     "trial_duration" INTEGER;
