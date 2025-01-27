/*
  Warnings:

  - You are about to drop the `View` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "View" DROP CONSTRAINT "View_product_id_fkey";

-- DropForeignKey
ALTER TABLE "View" DROP CONSTRAINT "View_visited_user_id_fkey";

-- DropForeignKey
ALTER TABLE "View" DROP CONSTRAINT "View_visitor_user_id_fkey";

-- DropTable
DROP TABLE "View";

-- CreateTable
CREATE TABLE "view" (
    "id" VARCHAR(50) NOT NULL,
    "context" "view_context" NOT NULL,
    "product_id" TEXT,
    "visited_user_id" TEXT,
    "visitor_user_id" TEXT,
    "visitor_hash_id" VARCHAR(100) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "view_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "view" ADD CONSTRAINT "view_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "product"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "view" ADD CONSTRAINT "view_visited_user_id_fkey" FOREIGN KEY ("visited_user_id") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "view" ADD CONSTRAINT "view_visitor_user_id_fkey" FOREIGN KEY ("visitor_user_id") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;
