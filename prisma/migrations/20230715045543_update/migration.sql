/*
  Warnings:

  - The primary key for the `Person` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The required column `id` was added to the `Person` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.

*/
-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_personEmail_fkey";

-- AlterTable
ALTER TABLE "Person" DROP CONSTRAINT "Person_pkey",
ADD COLUMN     "id" TEXT NOT NULL,
ALTER COLUMN "email" DROP NOT NULL,
ADD CONSTRAINT "Person_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "personId" TEXT;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_personId_fkey" FOREIGN KEY ("personId") REFERENCES "Person"("id") ON DELETE SET NULL ON UPDATE CASCADE;
