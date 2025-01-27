// import { Prisma, PrismaClient } from '@prisma/client'; // Para tipos de middleware
// import { IR2Provider } from '../src/providers/cloudflareR2/r2'; // Cloudflare R2 provider

// // Prisma Client
// const prisma = new PrismaClient();

// // Função para verificar se a string é Base64
// function isBase64(str: string): boolean {
//     const base64Pattern = /^data:image\/(png|jpg|jpeg|gif|bmp|webp);base64,/;
//     return base64Pattern.test(str);
// }

// // Função para fazer o upload da imagem
// async function uploadImageToR2(base64Image: string): Promise<{ imageName: string; key: string } | null> {
//     const R2 = new IR2Provider();
//     return await R2.uploadImage({
//         base64: base64Image,
//         imageSubPathName: 'documents',
//         fileNameWithExtension: undefined, // Nome do arquivo, caso necessário
//     });
// }

// // Função para tratar o upload de imagens em uma ação específica (create/update)
// async function handleImageUpload(data: any): Promise<void> {
//     if (data.image_url && isBase64(data.image_url)) {
//         console.log('Imagem em Base64 detectada');
//         data.image_url = (await uploadImageToR2(data.image_url))?.key;
//     } else {
//         console.log('Imagem não é Base64 ou não foi fornecida');
//     }
// }

// // Middleware do Prisma para interceptar operações
// prisma.$use(async (params: Prisma.MiddlewareParams, next) => {
//     if (params.model === 'category') {
//         if (params.action === 'createMany') {
//             // Ação para múltiplos registros
//             for (const data of params.args.data) {
//                 await handleImageUpload(data);
//             }
//         } else if (params.action === 'create' || params.action === 'update') {
//             // Ação para criação ou atualização de um único registro
//             await handleImageUpload(params.args.data);
//         }
//     }

//     return next(params);
// });

// export default prisma;
