/*
  Warnings:

  - You are about to drop the `Address` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Business` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `BusinessSocialMidia` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Category` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `CategoryBusiness` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `CellPhones` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Customer` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Role` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `UserRole` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `contryCode` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `socialMidia` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `userConfirmation` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Business" DROP CONSTRAINT "Business_customer_id_fkey";

-- DropForeignKey
ALTER TABLE "BusinessSocialMidia" DROP CONSTRAINT "BusinessSocialMidia_business_id_fkey";

-- DropForeignKey
ALTER TABLE "CategoryBusiness" DROP CONSTRAINT "CategoryBusiness_business_id_fkey";

-- DropForeignKey
ALTER TABLE "CategoryBusiness" DROP CONSTRAINT "CategoryBusiness_category_id_fkey";

-- DropForeignKey
ALTER TABLE "CellPhones" DROP CONSTRAINT "CellPhones_business_id_fkey";

-- DropForeignKey
ALTER TABLE "CellPhones" DROP CONSTRAINT "CellPhones_code_id_fkey";

-- DropForeignKey
ALTER TABLE "CellPhones" DROP CONSTRAINT "CellPhones_customer_id_fkey";

-- DropForeignKey
ALTER TABLE "Customer" DROP CONSTRAINT "Customer_user_id_fkey";

-- DropForeignKey
ALTER TABLE "UserRole" DROP CONSTRAINT "UserRole_roleId_fkey";

-- DropForeignKey
ALTER TABLE "UserRole" DROP CONSTRAINT "UserRole_user_id_fkey";

-- DropForeignKey
ALTER TABLE "userConfirmation" DROP CONSTRAINT "userConfirmation_user_id_fkey";

-- DropTable
DROP TABLE "Address";

-- DropTable
DROP TABLE "Business";

-- DropTable
DROP TABLE "BusinessSocialMidia";

-- DropTable
DROP TABLE "Category";

-- DropTable
DROP TABLE "CategoryBusiness";

-- DropTable
DROP TABLE "CellPhones";

-- DropTable
DROP TABLE "Customer";

-- DropTable
DROP TABLE "Role";

-- DropTable
DROP TABLE "User";

-- DropTable
DROP TABLE "UserRole";

-- DropTable
DROP TABLE "contryCode";

-- DropTable
DROP TABLE "socialMidia";

-- DropTable
DROP TABLE "userConfirmation";

-- CreateTable
CREATE TABLE "users" (
    "id" SERIAL NOT NULL,
    "email" TEXT,
    "first_name" VARCHAR(100) NOT NULL,
    "last_name" VARCHAR(100) NOT NULL,
    "username" VARCHAR(100) NOT NULL,
    "phone_number" VARCHAR(100) NOT NULL,
    "google_id" VARCHAR(255),
    "facebook_id" VARCHAR(255),
    "profile_picture" VARCHAR(255),
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,
    "is_confirmed" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users_confirmations" (
    "id" SERIAL NOT NULL,
    "code" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "hash" TEXT,
    "expires_at" TIMESTAMP(3) NOT NULL,
    "is_used" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "users_confirmations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "customers" (
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

    CONSTRAINT "customers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cellphones" (
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

    CONSTRAINT "cellphones_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "country_codes" (
    "id" SERIAL NOT NULL,
    "county" VARCHAR(100) NOT NULL,
    "code" VARCHAR(100) NOT NULL,

    CONSTRAINT "country_codes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "categories" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" VARCHAR(255),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "categories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "business_category" (
    "id" SERIAL NOT NULL,
    "business_id" INTEGER NOT NULL,
    "category_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "business_category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "business" (
    "id" SERIAL NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "bio" TEXT,
    "image_url" VARCHAR NOT NULL,
    "cover" VARCHAR NOT NULL,
    "is_active" BOOLEAN NOT NULL DEFAULT false,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "business_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "addresses" (
    "id" SERIAL NOT NULL,
    "city" VARCHAR(100) NOT NULL,
    "street_name" VARCHAR(100) NOT NULL,
    "street_number" VARCHAR(100) NOT NULL,
    "adress_complement" VARCHAR(100),
    "contry" VARCHAR(100) NOT NULL,
    "postal_code" VARCHAR(100) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "addresses_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "business_social_midia" (
    "id" SERIAL NOT NULL,
    "business_id" INTEGER NOT NULL,

    CONSTRAINT "business_social_midia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "social_midias" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "description" VARCHAR(100) NOT NULL,
    "logotipo" VARCHAR(100) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "social_midias_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- AddForeignKey
ALTER TABLE "users_confirmations" ADD CONSTRAINT "users_confirmations_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "customers" ADD CONSTRAINT "customers_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cellphones" ADD CONSTRAINT "cellphones_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customers"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cellphones" ADD CONSTRAINT "cellphones_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "business"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cellphones" ADD CONSTRAINT "cellphones_code_id_fkey" FOREIGN KEY ("code_id") REFERENCES "country_codes"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "business_category" ADD CONSTRAINT "business_category_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "business"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "business_category" ADD CONSTRAINT "business_category_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "categories"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "business" ADD CONSTRAINT "business_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "business_social_midia" ADD CONSTRAINT "business_social_midia_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "business"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
