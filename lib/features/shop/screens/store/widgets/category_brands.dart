import 'package:flutter/material.dart';
import 'package:testing_asg1/common/widgets/brands/brand_show_case.dart';
import 'package:testing_asg1/common/widgets/shimmers/boxes_shimmer.dart';
import 'package:testing_asg1/common/widgets/shimmers/list_tile_shimmer.dart';
import 'package:testing_asg1/features/shop/controllers/brand_controller.dart';
import 'package:testing_asg1/features/shop/controllers/category_controller.dart';
import 'package:testing_asg1/features/shop/models/category_model.dart';
import 'package:testing_asg1/features/shop/models/product_model.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';
import 'package:testing_asg1/utils/helpers/cloud_helper_functions.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({
    super.key, 
    required this.category,
  });

  final CategoryModel category;

   @override
Widget build(BuildContext context) {
  final brandController = BrandController.instance;
  final categoryController = CategoryController.instance;

  return FutureBuilder(
    future: categoryController.getSubCategories(category.id),
    builder: (context, subCatSnapshot) {
      if (subCatSnapshot.connectionState != ConnectionState.done) {
        return const TListTileShimmer();
      }
      if (subCatSnapshot.hasError || !subCatSnapshot.hasData) {
        return const SizedBox.shrink();
      }

      final subCategories = subCatSnapshot.data!;
      final List<String> categoryIds = [
        category.id,
        ...subCategories.map((c) => c.id)
      ];

      return FutureBuilder(
        future: brandController.getBrandsForCategory(category.id),
        builder: (context, brandSnapshot) {
          const loader = Column(
            children: [
              TListTileShimmer(),
              SizedBox(height: TSizes.spaceBtwItems),
              TBoxesShimmer(),
              SizedBox(height: TSizes.spaceBtwItems),
            ]
          );

          final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: brandSnapshot, loader: loader);
          if (widget != null) return widget;

         //final brands = brandSnapshot.data!;
          //final brands = (brandSnapshot.data! as List).take(2).toList();

          // Use Future.wait to fetch products for all brands at once
         return FutureBuilder<List<List<ProductModel>>>(
        future: Future.wait(
          (brandSnapshot.data! as List).map((brand) =>
            brandController.getBrandProductsForCategory(
              brandId: brand.id,
              categoryIds: categoryIds,
              limit: 3,
            )
          ),
        ),
        builder: (context, productsSnapshot) {
          if (productsSnapshot.connectionState != ConnectionState.done) {
            return loader;
          }
          if (productsSnapshot.hasError || !productsSnapshot.hasData) {
            return const SizedBox.shrink();
          }

          final brands = brandSnapshot.data! as List;
          final allBrandProducts = productsSnapshot.data!;
          final brandsWithProducts = <Widget>[];

          for (int i = 0; i < brands.length; i++) {
            final products = allBrandProducts[i];
            if (products.isNotEmpty) {
              brandsWithProducts.add(
                TBrandShowcase(
                  brand: brands[i],
                  images: products.map((e) => e.thumbnail).toList(),
                ),
              );
            }
          }

          // Only show the first 2 brands that have products
          if (brandsWithProducts.isEmpty) {
            return const Center(child: Text('No Data Found!'));
          }
          return Column(
            children: brandsWithProducts.take(2).toList(),
          );
        },
      );
        }
      );
    }
  );
}

 
}



  // @override
  // Widget build(BuildContext context) {
  //   final controller = BrandController.instance;
  //   return FutureBuilder(
  //     future: controller.getBrandsForCategory(category.id),
  //     builder: (context, snapshot) {
  //       const loader = Column(
  //         children: [
  //           TListTileShimmer(),
  //           SizedBox(height: TSizes.spaceBtwItems),
  //           TBoxesShimmer(),
  //           SizedBox(height: TSizes.spaceBtwItems),
  //         ]
  //       );

  //       final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
  //       if (widget != null) return widget;

  //       // Record Found
  //       final brands = snapshot.data!;

  //       return ListView.builder(
  //         shrinkWrap: true,
  //         physics: const NeverScrollableScrollPhysics(),
  //         itemCount: brands.length,
  //         itemBuilder: (_, index) {
  //           final brand = brands[index];
  //           return FutureBuilder(
  //             future: controller.getBrandProducts(brandId:brand.id, limit: 3),

  //             builder: (context, snapshot) {
  //               // Handle Loader, No Record, OR Error Message
  //               final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
  //               if (widget != null) return widget;

  //               // Record Found
  //               final products = snapshot.data!;

  //               return TBrandShowcase(brand: brand, images: products.map((e)=>e.thumbnail).toList());
              
  //             }
  //           );
  //         },
  //       );
  //     }
  //   );
  // }

// class CategoryBrands extends StatelessWidget {
//   const CategoryBrands({
//     super.key,
//     required this.category,
//   });

//   final CategoryModel category;

//   @override
//   Widget build(BuildContext context) {
//     final brandController = BrandController.instance;
//     final categoryController = CategoryController.instance;

//     // 1. First, get all subcategory IDs (including the main category)
//     return FutureBuilder(
//       future: categoryController.getSubCategories(category.id),
//       builder: (context, subCatSnapshot) {
//         if (subCatSnapshot.connectionState != ConnectionState.done) {
//           return const TListTileShimmer();
//         }
//         if (subCatSnapshot.hasError || !subCatSnapshot.hasData) {
//           return const SizedBox.shrink();
//         }

//         final subCategories = subCatSnapshot.data!;
//         final List<String> categoryIds = [
//           category.id,
//           ...subCategories.map((c) => c.id)
//         ];

//         // 2. Now get brands for this category
//         return FutureBuilder(
//           future: brandController.getBrandsForCategory(category.id),
//           builder: (context, brandSnapshot) {
//             const loader = Column(
//               children: [
//                 TListTileShimmer(),
//                 SizedBox(height: TSizes.spaceBtwItems),
//                 TBoxesShimmer(),
//                 SizedBox(height: TSizes.spaceBtwItems),
//               ]
//             );

//             final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: brandSnapshot, loader: loader);
//             if (widget != null) return widget;

//             final brands = brandSnapshot.data!;



// return FutureBuilder<List<List<ProductModel>>>(
//   future: Future.wait(
//     brands.map((brand) =>
//       brandController.getBrandProductsForCategory(
//         brandId: brand.id,
//         categoryIds: categoryIds,
//         limit: 3,
//       )
//     ),
//   ),
//   builder: (context, productsSnapshot) {
//     if (productsSnapshot.connectionState != ConnectionState.done) {
//       return loader;
//     }
//     if (productsSnapshot.hasError || !productsSnapshot.hasData) {
//       return const SizedBox.shrink();
//     }

//     final allBrandProducts = productsSnapshot.data!;
//     final brandsWithProducts = <Widget>[];

//     for (int i = 0; i < brands.length; i++) {
//       final products = allBrandProducts[i];
//       if (products.isNotEmpty) {
//         brandsWithProducts.add(
//           TBrandShowcase(
//             brand: brands[i],
//             images: products.map((e) => e.thumbnail).toList(),
//           ),
//         );
//       }
//     }

//     if (brandsWithProducts.isEmpty) {
//       return const Center(child: Text('No Data Found!'));
//     }

//     return Column(
//       children: brandsWithProducts,
//     );
//   },
// );
//           }
//         );
//       }
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:testing_asg1/common/widgets/brands/brand_show_case.dart';
// import 'package:testing_asg1/common/widgets/shimmers/boxes_shimmer.dart';
// import 'package:testing_asg1/common/widgets/shimmers/list_tile_shimmer.dart';
// import 'package:testing_asg1/features/shop/controllers/brand_controller.dart';
// import 'package:testing_asg1/features/shop/controllers/category_controller.dart';
// import 'package:testing_asg1/features/shop/models/category_model.dart';
// import 'package:testing_asg1/utils/constants/sizes.dart';
// import 'package:testing_asg1/utils/helpers/cloud_helper_functions.dart';

// class CategoryBrands extends StatelessWidget {
//   const CategoryBrands({
//     super.key,
//     required this.category,
//   });

//   final CategoryModel category;

//   @override
//   Widget build(BuildContext context) {
//     final brandController = BrandController.instance;
//     final categoryController = CategoryController.instance;

//     // First, get all subcategory IDs (including the main category)
//     return FutureBuilder(
//       future: categoryController.getSubCategories(category.id),
//       builder: (context, subCatSnapshot) {
//         if (subCatSnapshot.connectionState != ConnectionState.done) {
//           return const TListTileShimmer();
//         }
//         if (subCatSnapshot.hasError || !subCatSnapshot.hasData) {
//           return const SizedBox.shrink();
//         }

//         final subCategories = subCatSnapshot.data!;
//         final List<String> categoryIds = [
//           category.id,
//           ...subCategories.map((c) => c.id)
//         ];

//         // Now get brands for this category
//         return FutureBuilder(
//           future: brandController.getBrandsForCategory(category.id),
//           builder: (context, brandSnapshot) {
//             const loader = Column(
//               children: [
//                 TListTileShimmer(),
//                 SizedBox(height: TSizes.spaceBtwItems),
//                 TBoxesShimmer(),
//                 SizedBox(height: TSizes.spaceBtwItems),
//               ]
//             );

//             final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: brandSnapshot, loader: loader);
//             if (widget != null) return widget;

//             final brands = brandSnapshot.data!;
//             // return FutureBuilder<List<List<ProductModel>>>(
//             //   future: Future.wait(
//             //     brands.map((brand) =>
//             //       brandController.getBrandProductsForCategory(
//             //         brandId: brand.id,
//             //         categoryIds: categoryIds,
//             //         limit: 3,
//             //       )
//             //     ),
//             //   ),
//             //   builder: (context, productsSnapshot) {
//             //     if (productsSnapshot.connectionState != ConnectionState.done) {
//             //       return loader;
//             //     }
//             //     if (productsSnapshot.hasError || !productsSnapshot.hasData) {
//             //       return const SizedBox.shrink();
//             //     }

//             //     final allBrandProducts = productsSnapshot.data!;
//             //     final brandsWithProducts = <Widget>[];

//             //     for (int i = 0; i < brands.length; i++) {
//             //       final products = allBrandProducts[i];
//             //       if (products.isNotEmpty) {
//             //         brandsWithProducts.add(
//             //           TBrandShowcase(
//             //             brand: brands[i],
//             //             images: products.map((e) => e.thumbnail).toList(),
//             //           ),
//             //         );
//             //       }
//             //     }

//             //     if (brandsWithProducts.isEmpty) {
//             //       return const Center(child: Text('No Data Found!'));
//             //     }

//             //     return Column(
//             //       children: brandsWithProducts,
//             //     );
//             //   },
//             // );
//             return ListView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: brands.length,
//               itemBuilder: (_, index) {
//                 final brand = brands[index];
//                 return FutureBuilder(
//                   future: brandController.getBrandProductsForCategory(
//                     brandId: brand.id,
//                     categoryIds: categoryIds,
//                     limit: 3,
//                   ),
//                   builder: (context, productSnapshot) {
//                     final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: productSnapshot, loader: loader);
//                     if (widget != null) return widget;

//                     final products = productSnapshot.data!;
//                     if (products.isEmpty) return const SizedBox.shrink(); // Only show if products exist

//                     return TBrandShowcase(brand: brand, images: products.map((e) => e.thumbnail).toList());
//                   }
//                 );
//               },
//             );
//           }
//         );
//       }
//     );
//   }
// }

// class CategoryBrands extends StatelessWidget {
//   const CategoryBrands({
//     super.key, 
//     required this.category,
//   });

//   final CategoryModel category;

//   @override
//   Widget build(BuildContext context) {
//     final brandController = BrandController.instance;
//     final categoryController = CategoryController.instance;

//     return FutureBuilder(
//       future: categoryController.getSubCategories(category.id),
//       builder: (context, subCatSnapshot) {
//         if (subCatSnapshot.connectionState != ConnectionState.done) {
//           return const TListTileShimmer();
//         }
//         if (subCatSnapshot.hasError || !subCatSnapshot.hasData) {
//           return const SizedBox.shrink();
//         }

//         final subCategories = subCatSnapshot.data!;
//         final List<String> categoryIds = [
//           category.id,
//           ...subCategories.map((c) => c.id)
//         ];

//         return FutureBuilder(
//           future: brandController.getBrandsForCategory(category.id),
//           builder: (context, brandSnapshot) {
//             const loader = Column(
//               children: [
//                 TListTileShimmer(),
//                 SizedBox(height: TSizes.spaceBtwItems),
//                 TBoxesShimmer(),
//                 SizedBox(height: TSizes.spaceBtwItems),
//               ]
//             );

//             final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: brandSnapshot, loader: loader);
//             if (widget != null) return widget;

//             final brands = brandSnapshot.data!;

//             return ListView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: brands.length,
//               itemBuilder: (_, index) {
//                 final brand = brands[index];
//                 return FutureBuilder(
//                   future: brandController.getBrandProductsForCategory(
//                     brandId: brand.id,
//                     categoryIds: categoryIds,
//                     limit: 3,
//                   ),
//                   builder: (context, productSnapshot) {
//                     final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: productSnapshot, loader: loader);
//                     if (widget != null) return widget;

//                     final products = productSnapshot.data!;
//                     return TBrandShowcase(brand: brand, images: products.map((e) => e.thumbnail).toList());
//                   }
//                 );
//               },
//             );
//           }
//         );
//       }
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:testing_asg1/common/widgets/brands/brand_show_case.dart';
// import 'package:testing_asg1/common/widgets/shimmers/boxes_shimmer.dart';
// import 'package:testing_asg1/common/widgets/shimmers/list_tile_shimmer.dart';
// import 'package:testing_asg1/features/shop/controllers/brand_controller.dart';
// import 'package:testing_asg1/features/shop/controllers/category_controller.dart';
// import 'package:testing_asg1/features/shop/models/category_model.dart';
// import 'package:testing_asg1/utils/constants/sizes.dart';
// import 'package:testing_asg1/utils/helpers/cloud_helper_functions.dart';

// class CategoryBrands extends StatelessWidget {
//   const CategoryBrands({
//     super.key,
//     required this.category,
//   });

//   final CategoryModel category;

//   @override
//   Widget build(BuildContext context) {
//     final brandController = BrandController.instance;
//     final categoryController = CategoryController.instance;

//     // First, get all subcategory IDs (including the main category)
//     return FutureBuilder(
//       future: categoryController.getSubCategories(category.id),
//       builder: (context, subCatSnapshot) {
//         if (subCatSnapshot.connectionState != ConnectionState.done) {
//           return const TListTileShimmer();
//         }
//         if (subCatSnapshot.hasError || !subCatSnapshot.hasData) {
//           return const SizedBox.shrink();
//         }

//         final subCategories = subCatSnapshot.data!;
//         final List<String> categoryIds = [
//           category.id,
//           ...subCategories.map((c) => c.id)
//         ];

//         // Now get brands for this category
//         return FutureBuilder(
//           future: brandController.getBrandsForCategory(category.id),
//           builder: (context, brandSnapshot) {
//             const loader = Column(
//               children: [
//                 TListTileShimmer(),
//                 SizedBox(height: TSizes.spaceBtwItems),
//                 TBoxesShimmer(),
//                 SizedBox(height: TSizes.spaceBtwItems),
//               ]
//             );

//             final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: brandSnapshot, loader: loader);
//             if (widget != null) return widget;

//             final brands = brandSnapshot.data!;

//             return ListView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: brands.length,
//               itemBuilder: (_, index) {
//                 final brand = brands[index];
//                 return FutureBuilder(
//                   future: brandController.getBrandProductsForCategory(
//                     brandId: brand.id,
//                     categoryIds: categoryIds,
//                     limit: 3,
//                   ),
//                   builder: (context, productSnapshot) {
//                     final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: productSnapshot, loader: loader);
//                     if (widget != null) return widget;

//                     final products = productSnapshot.data!;
//                     return TBrandShowcase(brand: brand, images: products.map((e) => e.thumbnail).toList());
//                   }
//                 );
//               },
//             );
//           }
//         );
//       }
//     );
//   }
// }