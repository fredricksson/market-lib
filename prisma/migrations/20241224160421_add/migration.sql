-- AlterTable
ALTER TABLE "UserSession" ADD COLUMN     "browser" VARCHAR(50),
ADD COLUMN     "device" VARCHAR(100),
ADD COLUMN     "os" VARCHAR(50);
