-- CreateTable
CREATE TABLE "userConfirmation" (
    "id" VARCHAR(100) NOT NULL,
    "user_id" INTEGER NOT NULL,
    "expiresIn" TIMESTAMP(3) NOT NULL,
    "isExpired" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "userConfirmation_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "userConfirmation" ADD CONSTRAINT "userConfirmation_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
