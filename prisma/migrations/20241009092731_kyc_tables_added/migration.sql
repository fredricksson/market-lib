/*
  Warnings:

  - A unique constraint covering the columns `[user_id]` on the table `customers` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateTable
CREATE TABLE "customers_documents" (
    "id" SERIAL NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "front_image" VARCHAR(255) NOT NULL,
    "verse_image" VARCHAR(255) NOT NULL,
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

    CONSTRAINT "customers_documents_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "documents_types" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "documents_types_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "risk_levels" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "risk_levels_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "verifications_status" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "verifications_status_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "kyc_verifications" (
    "id" SERIAL NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "verification_status_id" INTEGER NOT NULL,
    "risk_level_id" INTEGER NOT NULL,
    "verification_date" TIMESTAMP(3),
    "notes" VARCHAR(255),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "kyc_verifications_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "customers_documents_customer_id_key" ON "customers_documents"("customer_id");

-- CreateIndex
CREATE UNIQUE INDEX "kyc_verifications_customer_id_key" ON "kyc_verifications"("customer_id");

-- CreateIndex
CREATE UNIQUE INDEX "customers_user_id_key" ON "customers"("user_id");

-- AddForeignKey
ALTER TABLE "customers_documents" ADD CONSTRAINT "customers_documents_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "customers_documents" ADD CONSTRAINT "customers_documents_document_type_id_fkey" FOREIGN KEY ("document_type_id") REFERENCES "documents_types"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "kyc_verifications" ADD CONSTRAINT "kyc_verifications_verification_status_id_fkey" FOREIGN KEY ("verification_status_id") REFERENCES "verifications_status"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "kyc_verifications" ADD CONSTRAINT "kyc_verifications_risk_level_id_fkey" FOREIGN KEY ("risk_level_id") REFERENCES "risk_levels"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "kyc_verifications" ADD CONSTRAINT "kyc_verifications_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
