-- CreateEnum
CREATE TYPE "Gender" AS ENUM ('Male', 'Female');

-- AlterTable
ALTER TABLE "users" ADD COLUMN     "birthdate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "gender" "Gender" NOT NULL DEFAULT 'Male';

-- AlterTable
ALTER TABLE "users_confirmations" ALTER COLUMN "updated_at" DROP DEFAULT;
