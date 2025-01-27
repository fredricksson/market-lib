-- AlterTable
ALTER TABLE "order" ADD COLUMN     "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3);

-- CreateTable
CREATE TABLE "merchant_customer" (
    "id" VARCHAR(50) NOT NULL,
    "merchant_id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "merchant_customer_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "merchant_customer" ADD CONSTRAINT "merchant_customer_merchant_id_fkey" FOREIGN KEY ("merchant_id") REFERENCES "customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "merchant_customer" ADD CONSTRAINT "merchant_customer_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
