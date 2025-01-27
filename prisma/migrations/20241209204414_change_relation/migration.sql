-- DropForeignKey
ALTER TABLE "referred" DROP CONSTRAINT "referred_referred_user_id_fkey";

-- AddForeignKey
ALTER TABLE "referred" ADD CONSTRAINT "referred_referred_user_id_fkey" FOREIGN KEY ("referred_user_id") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
