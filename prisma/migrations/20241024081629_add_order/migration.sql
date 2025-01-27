-- CreateEnum
CREATE TYPE "order_status" AS ENUM ('PENDING', 'DONE', 'CANCELED');

-- CreateEnum
CREATE TYPE "origin_order" AS ENUM ('SALE', 'CUSTOMER');

-- AlterTable
ALTER TABLE "product" ADD COLUMN     "purchase_price" DOUBLE PRECISION,
ADD COLUMN     "unit_purchase_price" DOUBLE PRECISION;

-- CreateTable
CREATE TABLE "order" (
    "id" VARCHAR(50) NOT NULL,
    "user_id" TEXT NOT NULL,
    "status" "order_status" NOT NULL DEFAULT 'PENDING',
    "origin" "origin_order" NOT NULL DEFAULT 'CUSTOMER',
    "total_price" TEXT NOT NULL,
    "customer_id" TEXT,
    "bussiness_id" TEXT,

    CONSTRAINT "order_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "item" (
    "id" VARCHAR(50) NOT NULL,
    "order_id" TEXT,
    "product_id" TEXT,
    "service_id" TEXT,
    "qty" INTEGER NOT NULL,
    "unit_price" DOUBLE PRECISION NOT NULL,
    "unit_purchase_price" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "item_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "order" ADD CONSTRAINT "order_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order" ADD CONSTRAINT "order_bussiness_id_fkey" FOREIGN KEY ("bussiness_id") REFERENCES "business"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "item" ADD CONSTRAINT "item_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "order"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "item" ADD CONSTRAINT "item_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "product"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "item" ADD CONSTRAINT "item_service_id_fkey" FOREIGN KEY ("service_id") REFERENCES "service"("id") ON DELETE SET NULL ON UPDATE CASCADE;
