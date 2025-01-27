-- AlterTable
ALTER TABLE "business" ALTER COLUMN "is_active" DROP NOT NULL,
ALTER COLUMN "is_deleted" DROP NOT NULL,
ALTER COLUMN "created_at" DROP NOT NULL,
ALTER COLUMN "updated_at" DROP NOT NULL;
