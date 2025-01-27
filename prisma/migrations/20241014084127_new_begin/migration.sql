/*
  Warnings:

  - You are about to drop the `Lead` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Product` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ProductImages` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ProductSegmentation` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Segmentation` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Service` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ServiceImages` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `addresses` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `business_social_midia` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `categories` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `cellphones` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `country_codes` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `customers` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `customers_documents` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `districts` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `documents_types` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `kyc_verifications` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `neighborhoods` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `provinces` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `risk_levels` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `social_midias` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `users` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `users_confirmations` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `verifications_status` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "gender" AS ENUM ('Male', 'Female');

-- DropForeignKey
ALTER TABLE "Product" DROP CONSTRAINT "Product_categoryId_fkey";

-- DropForeignKey
ALTER TABLE "Product" DROP CONSTRAINT "Product_customerId_fkey";

-- DropForeignKey
ALTER TABLE "ProductImages" DROP CONSTRAINT "ProductImages_productId_fkey";

-- DropForeignKey
ALTER TABLE "ProductSegmentation" DROP CONSTRAINT "ProductSegmentation_productId_fkey";

-- DropForeignKey
ALTER TABLE "ProductSegmentation" DROP CONSTRAINT "ProductSegmentation_segmentationId_fkey";

-- DropForeignKey
ALTER TABLE "Service" DROP CONSTRAINT "Service_categoryId_fkey";

-- DropForeignKey
ALTER TABLE "Service" DROP CONSTRAINT "Service_customerId_fkey";

-- DropForeignKey
ALTER TABLE "ServiceImages" DROP CONSTRAINT "ServiceImages_serviceId_fkey";

-- DropForeignKey
ALTER TABLE "business" DROP CONSTRAINT "business_customer_id_fkey";

-- DropForeignKey
ALTER TABLE "business_category" DROP CONSTRAINT "business_category_category_id_fkey";

-- DropForeignKey
ALTER TABLE "business_social_midia" DROP CONSTRAINT "business_social_midia_business_id_fkey";

-- DropForeignKey
ALTER TABLE "business_social_midia" DROP CONSTRAINT "business_social_midia_social_id_fkey";

-- DropForeignKey
ALTER TABLE "cellphones" DROP CONSTRAINT "cellphones_business_id_fkey";

-- DropForeignKey
ALTER TABLE "cellphones" DROP CONSTRAINT "cellphones_code_id_fkey";

-- DropForeignKey
ALTER TABLE "cellphones" DROP CONSTRAINT "cellphones_customer_id_fkey";

-- DropForeignKey
ALTER TABLE "customers" DROP CONSTRAINT "customers_user_id_fkey";

-- DropForeignKey
ALTER TABLE "customers_documents" DROP CONSTRAINT "customers_documents_customer_id_fkey";

-- DropForeignKey
ALTER TABLE "customers_documents" DROP CONSTRAINT "customers_documents_document_type_id_fkey";

-- DropForeignKey
ALTER TABLE "districts" DROP CONSTRAINT "districts_province_id_fkey";

-- DropForeignKey
ALTER TABLE "kyc_verifications" DROP CONSTRAINT "kyc_verifications_customer_id_fkey";

-- DropForeignKey
ALTER TABLE "kyc_verifications" DROP CONSTRAINT "kyc_verifications_risk_level_id_fkey";

-- DropForeignKey
ALTER TABLE "kyc_verifications" DROP CONSTRAINT "kyc_verifications_verification_status_id_fkey";

-- DropForeignKey
ALTER TABLE "neighborhoods" DROP CONSTRAINT "neighborhoods_district_id_fkey";

-- DropForeignKey
ALTER TABLE "users" DROP CONSTRAINT "users_neighborhood_id_fkey";

-- DropForeignKey
ALTER TABLE "users_confirmations" DROP CONSTRAINT "users_confirmations_user_id_fkey";

-- AlterTable
ALTER TABLE "business" ALTER COLUMN "updated_at" SET DEFAULT CURRENT_TIMESTAMP;

-- DropTable
DROP TABLE "Lead";

-- DropTable
DROP TABLE "Product";

-- DropTable
DROP TABLE "ProductImages";

-- DropTable
DROP TABLE "ProductSegmentation";

-- DropTable
DROP TABLE "Segmentation";

-- DropTable
DROP TABLE "Service";

-- DropTable
DROP TABLE "ServiceImages";

-- DropTable
DROP TABLE "addresses";

-- DropTable
DROP TABLE "business_social_midia";

-- DropTable
DROP TABLE "categories";

-- DropTable
DROP TABLE "cellphones";

-- DropTable
DROP TABLE "country_codes";

-- DropTable
DROP TABLE "customers";

-- DropTable
DROP TABLE "customers_documents";

-- DropTable
DROP TABLE "districts";

-- DropTable
DROP TABLE "documents_types";

-- DropTable
DROP TABLE "kyc_verifications";

-- DropTable
DROP TABLE "neighborhoods";

-- DropTable
DROP TABLE "provinces";

-- DropTable
DROP TABLE "risk_levels";

-- DropTable
DROP TABLE "social_midias";

-- DropTable
DROP TABLE "users";

-- DropTable
DROP TABLE "users_confirmations";

-- DropTable
DROP TABLE "verifications_status";

-- DropEnum
DROP TYPE "Gender";

-- CreateTable
CREATE TABLE "user" (
    "id" SERIAL NOT NULL,
    "email" TEXT,
    "first_name" VARCHAR(100) NOT NULL,
    "last_name" VARCHAR(100) NOT NULL,
    "username" VARCHAR(100) NOT NULL,
    "phone_number" VARCHAR(100) NOT NULL,
    "google_id" VARCHAR(255),
    "facebook_id" VARCHAR(255),
    "profile_picture" VARCHAR(255),
    "birthdate" TIMESTAMP(3) NOT NULL,
    "gender" "gender" NOT NULL DEFAULT 'Male',
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,
    "is_confirmed" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "neighborhood_id" VARCHAR(255),

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "province" (
    "id" VARCHAR(50) NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "region" VARCHAR(50) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "province_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "district" (
    "id" VARCHAR(50) NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "province_id" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "district_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "neighborhood" (
    "id" VARCHAR(50) NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "district_id" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "neighborhood_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_confirmation" (
    "id" SERIAL NOT NULL,
    "code" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "hash" TEXT,
    "expires_at" TIMESTAMP(3) NOT NULL,
    "is_used" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "user_confirmation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "customer" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "city" VARCHAR(100) NOT NULL,
    "neighborhood_id" VARCHAR(100) NOT NULL,
    "gender" VARCHAR(100) NOT NULL,
    "birth_date" DATE NOT NULL,
    "type" VARCHAR(100) NOT NULL,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "customer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cell_phone" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "phone_number" VARCHAR(100) NOT NULL,
    "customer_id" INTEGER,
    "business_id" INTEGER,
    "code_id" INTEGER,
    "is_main" BOOLEAN NOT NULL DEFAULT false,
    "mobile_operator_name" VARCHAR(100) NOT NULL,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "cell_phone_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "country_code" (
    "id" SERIAL NOT NULL,
    "country" VARCHAR(100) NOT NULL,
    "code" VARCHAR(100) NOT NULL,

    CONSTRAINT "country_code_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "category" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" VARCHAR(255),
    "type" VARCHAR(60),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "address" (
    "id" SERIAL NOT NULL,
    "city" VARCHAR(100) NOT NULL,
    "street_name" VARCHAR(100) NOT NULL,
    "street_number" VARCHAR(100) NOT NULL,
    "address_complement" VARCHAR(100),
    "country" VARCHAR(100) NOT NULL,
    "postal_code" VARCHAR(100) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "address_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "business_social_media" (
    "id" SERIAL NOT NULL,
    "business_id" INTEGER NOT NULL,
    "social_id" INTEGER NOT NULL,

    CONSTRAINT "business_social_media_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "social_media" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "description" VARCHAR(100) NOT NULL,
    "logo" VARCHAR(100) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "social_media_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lead" (
    "id" SERIAL NOT NULL,
    "email" TEXT,
    "first_name" TEXT,
    "last_name" TEXT,
    "whats_app" TEXT NOT NULL,

    CONSTRAINT "lead_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "product" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "price" DOUBLE PRECISION NOT NULL,
    "cover_image_url" TEXT,
    "stock_quantity" INTEGER NOT NULL,
    "category_id" INTEGER NOT NULL,
    "customer_id" INTEGER,
    "is_deleted" BOOLEAN DEFAULT false,
    "is_active" BOOLEAN DEFAULT false,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "product_image" (
    "id" SERIAL NOT NULL,
    "image_url" TEXT NOT NULL,
    "product_id" INTEGER NOT NULL,

    CONSTRAINT "product_image_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "service" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "cover_image_url" TEXT,
    "description" TEXT,
    "customer_id" INTEGER,
    "category_id" INTEGER NOT NULL,

    CONSTRAINT "service_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "segmentation" (
    "id" SERIAL NOT NULL,
    "type" TEXT NOT NULL,
    "value" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "segmentation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "product_segmentation" (
    "id" SERIAL NOT NULL,
    "product_id" INTEGER NOT NULL,
    "segmentation_id" INTEGER NOT NULL,

    CONSTRAINT "product_segmentation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "customer_document" (
    "id" SERIAL NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "front_image" VARCHAR(255) NOT NULL,
    "back_image" VARCHAR(255) NOT NULL,
    "selfie_with_doc" VARCHAR(255) NOT NULL,
    "full_name" VARCHAR(100) NOT NULL,
    "birthplace" VARCHAR(100) NOT NULL,
    "address" VARCHAR(100) NOT NULL,
    "document_number" VARCHAR(100) NOT NULL,
    "document_type_id" INTEGER NOT NULL,
    "issue_date" TIMESTAMP(3) NOT NULL,
    "expires_at" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "customer_document_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "document_type" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "document_type_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "risk_level" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "risk_level_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "verification_status" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "verification_status_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "kyc_verification" (
    "id" SERIAL NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "verification_status_id" INTEGER NOT NULL,
    "risk_level_id" INTEGER NOT NULL,
    "verification_date" TIMESTAMP(3),
    "notes" VARCHAR(255),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "kyc_verification_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_email_key" ON "user"("email");

-- CreateIndex
CREATE UNIQUE INDEX "province_id_key" ON "province"("id");

-- CreateIndex
CREATE UNIQUE INDEX "province_name_key" ON "province"("name");

-- CreateIndex
CREATE UNIQUE INDEX "district_id_key" ON "district"("id");

-- CreateIndex
CREATE UNIQUE INDEX "district_name_key" ON "district"("name");

-- CreateIndex
CREATE UNIQUE INDEX "neighborhood_id_key" ON "neighborhood"("id");

-- CreateIndex
CREATE UNIQUE INDEX "neighborhood_name_key" ON "neighborhood"("name");

-- CreateIndex
CREATE UNIQUE INDEX "customer_user_id_key" ON "customer"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "lead_email_key" ON "lead"("email");

-- CreateIndex
CREATE UNIQUE INDEX "customer_document_customer_id_key" ON "customer_document"("customer_id");

-- CreateIndex
CREATE UNIQUE INDEX "kyc_verification_customer_id_key" ON "kyc_verification"("customer_id");

-- AddForeignKey
ALTER TABLE "user" ADD CONSTRAINT "user_neighborhood_id_fkey" FOREIGN KEY ("neighborhood_id") REFERENCES "neighborhood"("id") ON DELETE SET NULL ON UPDATE CASCADE;

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
