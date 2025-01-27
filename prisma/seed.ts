import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
    // Criar categorias
    const categories = await Promise.all([
        prisma.category.create({
            data: {
                name: 'Electronics',
                description: 'Devices and gadgets',
                type: 'Product',
                slug: 'electronics',
            },
        }),
        prisma.category.create({
            data: {
                name: 'Services',
                description: 'Various services offered',
                type: 'Service',
                slug: 'services',
            },
        }),
    ]);

    console.log('Categories created:', categories);

    // Criar segmentações
    const segmentations = await Promise.all([
        prisma.segmentation.create({
            data: {
                type: 'Gender',
                value: 'Male',
            },
        }),
        prisma.segmentation.create({
            data: {
                type: 'AgeRange',
                value: '18-25',
            },
        }),
    ]);

    console.log('Segmentations created:', segmentations);

    // Criar papéis (roles)

    // Criar um usuário e associá-lo a um papel
    const user = await prisma.user.create({
        data: {
            email: 'johndoe@example.com',
            first_name: 'John',
            last_name: 'Doe',
            username: 'johndoe',
            phone_number: '1234567890',
            birthdate: new Date('1990-01-01'),
            gender: 'Male',
            neighborhood: {
                create: {
                    name: 'Downtown',
                    district: {
                        create: {
                            name: 'Central',
                            province: {
                                create: {
                                    name: 'Province A',
                                    region: 'Region 1',
                                },
                            },
                        },
                    },
                },
            },
        },
    });

    console.log('User created:', user);
}

main()
    .catch((e) => {
        console.error(e);
        process.exit(1);
    })
    .finally(async () => {
        await prisma.$disconnect();
    });
