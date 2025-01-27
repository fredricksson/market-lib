-- CreateTable
CREATE TABLE "service_image" (
    "id" VARCHAR(50) NOT NULL,
    "image_url" TEXT NOT NULL,
    "service_id" TEXT NOT NULL,

    CONSTRAINT "service_image_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "service_image" ADD CONSTRAINT "service_image_service_id_fkey" FOREIGN KEY ("service_id") REFERENCES "service"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
