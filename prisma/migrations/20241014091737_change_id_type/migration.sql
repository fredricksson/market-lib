/*
  Warnings:

  - The primary key for the `address` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `business` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `business_category` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `business_social_media` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `category` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `cell_phone` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `country_code` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `customer` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `customer_document` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `province_id` on the `district` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(50)`.
  - The primary key for the `document_type` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `kyc_verification` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `lead` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `district_id` on the `neighborhood` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(50)`.
  - The primary key for the `product` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `product_image` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `product_segmentation` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `risk_level` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `segmentation` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `service` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `social_media` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `user` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `user_confirmation` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `verification_status` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropForeignKey
ALTER TABLE "business" DROP CONSTRAINT "business_customer_id_fkey";

-- DropForeignKey
ALTER TABLE "business_category" DROP CONSTRAINT "business_category_business_id_fkey";

-- DropForeignKey
ALTER TABLE "business_category" DROP CONSTRAINT "business_category_category_id_fkey";

-- DropForeignKey
ALTER TABLE "business_social_media" DROP CONSTRAINT "business_social_media_business_id_fkey";

-- DropForeignKey
ALTER TABLE "business_social_media" DROP CONSTRAINT "business_social_media_social_id_fkey";

-- DropForeignKey
ALTER TABLE "cell_phone" DROP CONSTRAINT "cell_phone_business_id_fkey";

-- DropForeignKey
ALTER TABLE "cell_phone" DROP CONSTRAINT "cell_phone_code_id_fkey";

-- DropForeignKey
ALTER TABLE "cell_phone" DROP CONSTRAINT "cell_phone_customer_id_fkey";

-- DropForeignKey
ALTER TABLE "customer" DROP CONSTRAINT "customer_user_id_fkey";

-- DropForeignKey
ALTER TABLE "customer_document" DROP CONSTRAINT "customer_document_customer_id_fkey";

-- DropForeignKey
ALTER TABLE "customer_document" DROP CONSTRAINT "customer_document_document_type_id_fkey";

-- DropForeignKey
ALTER TABLE "district" DROP CONSTRAINT "district_province_id_fkey";

-- DropForeignKey
ALTER TABLE "kyc_verification" DROP CONSTRAINT "kyc_verification_customer_id_fkey";

-- DropForeignKey
ALTER TABLE "kyc_verification" DROP CONSTRAINT "kyc_verification_risk_level_id_fkey";

-- DropForeignKey
ALTER TABLE "kyc_verification" DROP CONSTRAINT "kyc_verification_verification_status_id_fkey";

-- DropForeignKey
ALTER TABLE "neighborhood" DROP CONSTRAINT "neighborhood_district_id_fkey";

-- DropForeignKey
ALTER TABLE "product" DROP CONSTRAINT "product_category_id_fkey";

-- DropForeignKey
ALTER TABLE "product" DROP CONSTRAINT "product_customer_id_fkey";

-- DropForeignKey
ALTER TABLE "product_image" DROP CONSTRAINT "product_image_product_id_fkey";

-- DropForeignKey
ALTER TABLE "product_segmentation" DROP CONSTRAINT "product_segmentation_product_id_fkey";

-- DropForeignKey
ALTER TABLE "product_segmentation" DROP CONSTRAINT "product_segmentation_segmentation_id_fkey";

-- DropForeignKey
ALTER TABLE "service" DROP CONSTRAINT "service_category_id_fkey";

-- DropForeignKey
ALTER TABLE "service" DROP CONSTRAINT "service_customer_id_fkey";

-- DropForeignKey
ALTER TABLE "user_confirmation" DROP CONSTRAINT "user_confirmation_user_id_fkey";

-- AlterTable
ALTER TABLE "address" DROP CONSTRAINT "address_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE VARCHAR(50),
ADD CONSTRAINT "address_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "address_id_seq";

-- AlterTable
ALTER TABLE "business" DROP CONSTRAINT "business_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "customer_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "business_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "business_id_seq";

-- AlterTable
ALTER TABLE "business_category" DROP CONSTRAINT "business_category_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "business_id" SET DATA TYPE TEXT,
ALTER COLUMN "category_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "business_category_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "business_category_id_seq";

-- AlterTable
ALTER TABLE "business_social_media" DROP CONSTRAINT "business_social_media_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "business_id" SET DATA TYPE TEXT,
ALTER COLUMN "social_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "business_social_media_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "business_social_media_id_seq";

-- AlterTable
ALTER TABLE "category" DROP CONSTRAINT "category_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE VARCHAR(50),
ADD CONSTRAINT "category_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "category_id_seq";

-- AlterTable
ALTER TABLE "cell_phone" DROP CONSTRAINT "cell_phone_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "customer_id" SET DATA TYPE TEXT,
ALTER COLUMN "business_id" SET DATA TYPE TEXT,
ALTER COLUMN "code_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "cell_phone_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "cell_phone_id_seq";

-- AlterTable
ALTER TABLE "country_code" DROP CONSTRAINT "country_code_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE VARCHAR(50),
ADD CONSTRAINT "country_code_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "country_code_id_seq";

-- AlterTable
ALTER TABLE "customer" DROP CONSTRAINT "customer_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "user_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "customer_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "customer_id_seq";

-- AlterTable
ALTER TABLE "customer_document" DROP CONSTRAINT "customer_document_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "customer_id" SET DATA TYPE TEXT,
ALTER COLUMN "document_type_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "customer_document_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "customer_document_id_seq";

-- AlterTable
ALTER TABLE "district" ALTER COLUMN "province_id" SET DATA TYPE VARCHAR(50);

-- AlterTable
ALTER TABLE "document_type" DROP CONSTRAINT "document_type_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE VARCHAR(50),
ADD CONSTRAINT "document_type_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "document_type_id_seq";

-- AlterTable
ALTER TABLE "kyc_verification" DROP CONSTRAINT "kyc_verification_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "customer_id" SET DATA TYPE TEXT,
ALTER COLUMN "verification_status_id" SET DATA TYPE TEXT,
ALTER COLUMN "risk_level_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "kyc_verification_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "kyc_verification_id_seq";

-- AlterTable
ALTER TABLE "lead" DROP CONSTRAINT "lead_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE VARCHAR(50),
ADD CONSTRAINT "lead_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "lead_id_seq";

-- AlterTable
ALTER TABLE "neighborhood" ALTER COLUMN "district_id" SET DATA TYPE VARCHAR(50);

-- AlterTable
ALTER TABLE "product" DROP CONSTRAINT "product_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "category_id" SET DATA TYPE TEXT,
ALTER COLUMN "customer_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "product_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "product_id_seq";

-- AlterTable
ALTER TABLE "product_image" DROP CONSTRAINT "product_image_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "product_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "product_image_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "product_image_id_seq";

-- AlterTable
ALTER TABLE "product_segmentation" DROP CONSTRAINT "product_segmentation_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "product_id" SET DATA TYPE TEXT,
ALTER COLUMN "segmentation_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "product_segmentation_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "product_segmentation_id_seq";

-- AlterTable
ALTER TABLE "risk_level" DROP CONSTRAINT "risk_level_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE VARCHAR(50),
ADD CONSTRAINT "risk_level_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "risk_level_id_seq";

-- AlterTable
ALTER TABLE "segmentation" DROP CONSTRAINT "segmentation_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE VARCHAR(50),
ADD CONSTRAINT "segmentation_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "segmentation_id_seq";

-- AlterTable
ALTER TABLE "service" DROP CONSTRAINT "service_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "customer_id" SET DATA TYPE TEXT,
ALTER COLUMN "category_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "service_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "service_id_seq";

-- AlterTable
ALTER TABLE "social_media" DROP CONSTRAINT "social_media_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE VARCHAR(50),
ADD CONSTRAINT "social_media_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "social_media_id_seq";

-- AlterTable
ALTER TABLE "user" DROP CONSTRAINT "user_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE VARCHAR(50),
ADD CONSTRAINT "user_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "user_id_seq";

-- AlterTable
ALTER TABLE "user_confirmation" DROP CONSTRAINT "user_confirmation_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "user_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "user_confirmation_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "user_confirmation_id_seq";

-- AlterTable
ALTER TABLE "verification_status" DROP CONSTRAINT "verification_status_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE VARCHAR(50),
ADD CONSTRAINT "verification_status_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "verification_status_id_seq";

-- AddForeignKey
ALTER TABLE "district" ADD CONSTRAINT "district_province_id_fkey" FOREIGN KEY ("province_id") REFERENCES "province"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "neighborhood" ADD CONSTRAINT "neighborhood_district_id_fkey" FOREIGN KEY ("district_id") REFERENCES "district"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_confirmation" ADD CONSTRAINT "user_confirmation_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "customer" ADD CONSTRAINT "customer_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cell_phone" ADD CONSTRAINT "cell_phone_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customer"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cell_phone" ADD CONSTRAINT "cell_phone_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "business"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cell_phone" ADD CONSTRAINT "cell_phone_code_id_fkey" FOREIGN KEY ("code_id") REFERENCES "country_code"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "business_category" ADD CONSTRAINT "business_category_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "business"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "business_category" ADD CONSTRAINT "business_category_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "business" ADD CONSTRAINT "business_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "business_social_media" ADD CONSTRAINT "business_social_media_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "business"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "business_social_media" ADD CONSTRAINT "business_social_media_social_id_fkey" FOREIGN KEY ("social_id") REFERENCES "social_media"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product" ADD CONSTRAINT "product_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product" ADD CONSTRAINT "product_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customer"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_image" ADD CONSTRAINT "product_image_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "service" ADD CONSTRAINT "service_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "service" ADD CONSTRAINT "service_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customer"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_segmentation" ADD CONSTRAINT "product_segmentation_segmentation_id_fkey" FOREIGN KEY ("segmentation_id") REFERENCES "segmentation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_segmentation" ADD CONSTRAINT "product_segmentation_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "customer_document" ADD CONSTRAINT "customer_document_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "customer_document" ADD CONSTRAINT "customer_document_document_type_id_fkey" FOREIGN KEY ("document_type_id") REFERENCES "document_type"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "kyc_verification" ADD CONSTRAINT "kyc_verification_verification_status_id_fkey" FOREIGN KEY ("verification_status_id") REFERENCES "verification_status"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "kyc_verification" ADD CONSTRAINT "kyc_verification_risk_level_id_fkey" FOREIGN KEY ("risk_level_id") REFERENCES "risk_level"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "kyc_verification" ADD CONSTRAINT "kyc_verification_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
