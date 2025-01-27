-- AlterTable
ALTER TABLE "product" ADD COLUMN     "property_type_id" TEXT,
ALTER COLUMN "stock_quantity" SET DATA TYPE TEXT;

-- CreateTable
CREATE TABLE "property_type" (
    "id" VARCHAR(50) NOT NULL,
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "property_type_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "property_type_name_key" ON "property_type"("name");

-- CreateIndex
CREATE UNIQUE INDEX "property_type_slug_key" ON "property_type"("slug");

-- AddForeignKey
ALTER TABLE "product" ADD CONSTRAINT "product_property_type_id_fkey" FOREIGN KEY ("property_type_id") REFERENCES "property_type"("id") ON DELETE SET NULL ON UPDATE CASCADE;
