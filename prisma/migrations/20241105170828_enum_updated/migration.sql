/*
  Warnings:

  - The values [CANCELED] on the enum `order_status` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "order_status_new" AS ENUM ('PENDING', 'DONE', 'CANCELLED');
ALTER TABLE "order" ALTER COLUMN "status" DROP DEFAULT;
ALTER TABLE "order" ALTER COLUMN "status" TYPE "order_status_new" USING ("status"::text::"order_status_new");
ALTER TYPE "order_status" RENAME TO "order_status_old";
ALTER TYPE "order_status_new" RENAME TO "order_status";
DROP TYPE "order_status_old";
ALTER TABLE "order" ALTER COLUMN "status" SET DEFAULT 'PENDING';
COMMIT;
