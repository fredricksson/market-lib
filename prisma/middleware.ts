// import { Prisma } from '@prisma/client'; // Para tipos de middleware
// import prisma from './client'; // Prisma Client
// import { IR2Provider } from '../src/providers/cloudflareR2/r2'; // Cloudflare R2 provider

// // Função para verificar se a string é Base64
// function isBase64(str: string): boolean {
//     const base64Pattern = /^data:image\/(png|jpg|jpeg|gif|bmp|webp);base64,/;
//     return base64Pattern.test(str);
// }

// // Middleware do Prisma para interceptar operações
// prisma.$use(async (params: Prisma.MiddlewareParams, next) => {
//     const R2 = new IR2Provider();
//     console.log('+++++++++++++++++++++++++++++++++++++++++');
//     if (params.model === 'category') {
//         if (params.action === 'create' || params.action === 'update') {
//             // Manipulação do campo 'image_url' antes de salvar
//             if (params.args.data.image_url && isBase64(params.args.data.image_url)) {
//                 console.log('Imagem em Base64 detectada em category');

//                 // Fazer upload da imagem para o serviço (Cloudflare R2)
//                 const uploadedImageUrl = await R2.uploadImage({
//                     base64: params.args.data.image_url,
//                     imageSubPathName: 'documents',
//                     fileNameWithExtension: undefined, // Nome do arquivo, caso necessário
//                 });

//                 // Atualizar o campo 'image_url' com a URL retornada do upload
//                 params.args.data.image_url = uploadedImageUrl;
//             } else {
//                 console.log('Imagem não é Base64 ou não foi fornecida');
//             }
//         }
//     }

//     return next(params);
// });
