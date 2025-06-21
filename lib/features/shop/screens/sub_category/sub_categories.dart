import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_asg1/common/widgets/appbar/appbar.dart';
import 'package:testing_asg1/common/widgets/images/t_rounded_image.dart';
import 'package:testing_asg1/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:testing_asg1/common/widgets/shimmers/horizontal_product_shimmer.dart';
import 'package:testing_asg1/common/widgets/texts/section_heading.dart';
import 'package:testing_asg1/features/shop/controllers/category_controller.dart';
import 'package:testing_asg1/features/shop/models/category_model.dart';
import 'package:testing_asg1/features/shop/screens/all_products/all_products.dart';
import 'package:testing_asg1/utils/constants/image_strings.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';
import 'package:testing_asg1/utils/helpers/cloud_helper_functions.dart';

// final Map<String, List<String>> subCategoriesMap = {
//   'Health': ['Health Supplements', 'First Aid', 'Home Health Care', 'Over the Counter', 'Medical Device'],
//   'Skin Care': ['Facial Care', 'Hand & Body', 'Sun Care'],
//   'Personal Care': ['Bath Care', 'Oral Care', 'Feminine Hygiene', 'Men\'s Grooming', 'Deodorants'],
//   'Hair Care': ['Shampoo', 'Conditioner', 'Hair Treatment', 'Styling'],
//   'Baby Care': ['Baby Bath and Hair', 'Baby Skin Care', 'Baby Diapers', 'Baby Food'],
//   'Household': ['Cleaning', 'Bathroom', 'Household Sundries'],
// };

// final Map<String, Map<String, List<String>>> subCategoryImages = {
//   'Health': {
//     'Health Supplements': [TImages.productImage57, TImages.productImage58, TImages.productImage59],
//     'First Aid': [TImages.productImage49, TImages.productImage50, TImages.productImage51],
//     'Home Health Care': [TImages.productImage67, TImages.productImage68, TImages.productImage69],
//     'Over the Counter': [TImages.productImage85, TImages.productImage86, TImages.productImage87],
//     'Medical Device': [TImages.productImage79, TImages.productImage80, TImages.productImage81],
//   },
//   'Skin Care': {
//     'Facial Care': [TImages.productImage111, TImages.productImage112, TImages.productImage113],
//     'Hand & Body': [TImages.productImage123, TImages.productImage124, TImages.productImage125],
//     'Sun Care': [TImages.productImage130, TImages.productImage131, TImages.productImage132],
//   },
//   'Personal Care': {
//     'Bath Care' : [TImages.productImage111], 
//     'Oral Care' : [TImages.productImage111], 
//     'Feminine Hygiene' : [TImages.productImage111], 
//     'Men\'s Grooming' : [TImages.productImage111], 
//     'Deodorants' : [TImages.productImage111],
//   },
//   'Hair Care': {
//     'Shampoo' : [TImages.productImage111], 
//     'Conditioner' : [TImages.productImage111],
//     'Hair Treatment' : [TImages.productImage111],
//     'Styling' : [TImages.productImage111],
//   },
//   'Baby Care': {
//     'Baby Bath and Hair' : [TImages.productImage111],
//     'Baby Skin Care' : [TImages.productImage111],
//     'Baby Diapers' : [TImages.productImage111],
//     'Baby Food' : [TImages.productImage111],
//   },
//   'Household': {
//     'Cleaning' : [TImages.productImage111],
//     'Bathroom' : [TImages.productImage111],
//     'Household Sundries' : [TImages.productImage111],
//   },
// };

class SubCategoriesScreen extends StatelessWidget {
  // final String categoryTitle;

  // const SubCategoriesScreen({super.key, required this.categoryTitle});

  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  // String getBannerImage() {
  //   switch (categoryTitle) {
  //     case 'Health':
  //       return TImages.bannerHealth;
  //     case 'Skin Care':
  //       return TImages.bannerSkinCare;
  //     case 'Personal Care':
  //       return TImages.bannerPersonalCare;
  //     case 'Hair Care':
  //       return TImages.bannerHairCare;
  //     case 'Baby Care':
  //       return TImages.bannerBabyCare;
  //     case 'Household':
  //       return TImages.bannerHousehold;
  //     default:
  //       return TImages.myBanner1;
  //   }
  // }

  // @override
  // Widget build(BuildContext context) {
  //   final subCats = subCategoriesMap[categoryTitle] ?? [];

  //   return Scaffold(
  //     appBar: TAppBar(title: Text(categoryTitle), showBackArrow: true),
  //     body: SingleChildScrollView(
  //       child: Column(
  //         children: [
  //           /// Top banner
  //           Padding(
  //             padding: const EdgeInsets.all(TSizes.defaultSpace),
  //             child: TRoundedImage(
  //               width: double.infinity,
  //               imageUrl: getBannerImage(),
  //               applyImageRadius: true,
  //             ),
  //           ),
  //           const SizedBox(height: TSizes.spaceBtwSections),

  //           /// Sectioned Subcategory Layout
  //           Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
  //             child: Column(
  //               children: subCats.map((subCat) {
  //                 final images = subCategoryImages[categoryTitle]?[subCat] ?? [];

  //                 return Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     TSectionHeading(title: subCat, onPressed: () {}),
  //                     const SizedBox(height: TSizes.spaceBtwItems / 2),
  //                     SizedBox(
  //                       height: 120,
  //                       child: ListView.separated(
  //                         itemCount: images.length,
  //                         scrollDirection: Axis.horizontal,
  //                         separatorBuilder: (_, __) => const SizedBox(width: TSizes.spaceBtwItems),
  //                         itemBuilder: (_, index) => TProductCardHorizontal(imageUrl: images[index]),
  //                       ),
  //                     ),
  //                     const SizedBox(height: TSizes.spaceBtwSections),
  //                   ],
  //                 );
  //               }).toList(),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: TAppBar(title: Text(category.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Top banner
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: TRoundedImage(
                width: double.infinity,
                imageUrl: TImages.promoBanner1,
                applyImageRadius: true,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Sub-Categories 
            FutureBuilder(
              future: controller.getSubCategories(category.id),
              builder: (context, snapshot) {

                // Handle Loader, No Recored, OR Error Message
                const loader = THorizontalProductShimmer();
                final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                if(widget!=null) return widget;

                // Record found.
                final subCategories = snapshot.data!;


                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: subCategories.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_,index){

                    final subCategory = subCategories[index];

                    return FutureBuilder(
                      future: controller.getCategoryProducts(categoryId: subCategory.id),
                      builder: (context, snapshot) {
                        // Handle Loader, No Recored, OR Error Message
                        final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                        if(widget!=null) return widget;

                        // Product found.
                        final products = snapshot.data!;


                        return Column(
                          children: [
                            /// Heading 
                            TSectionHeading(
                              title: subCategory.name, 
                              onPressed: () => Get.to(
                                () => AllProducts(
                                  title: subCategory.name,
                                  futureMethod: controller.getCategoryProducts(categoryId: subCategory.id,limit:-1),
                                )
                              )
                            ),
                            const SizedBox(height: TSizes.spaceBtwItems / 2),
                        
                            SizedBox(
                              height: 120, 
                              child: ListView.separated(
                                itemCount: products.length, 
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems),
                                itemBuilder: (context, index) => TProductCardHorizontal(product: products[index]),
                              ),
                            ),

                            const SizedBox(height: TSizes.spaceBtwSections),
                          ],
                        );
                      }
                    );
                  },
                );
              }
            ),
            
            // /// Sectioned Subcategory Layout
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
            //   child: Column(
            //     children: subCats.map((subCat) {
            //       final images = subCategoryImages[categoryTitle]?[subCat] ?? [];

            //       return Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           TSectionHeading(title: subCat, onPressed: () {}),
            //           const SizedBox(height: TSizes.spaceBtwItems / 2),
            //           SizedBox(
            //             height: 120,
            //             child: ListView.separated(
            //               itemCount: images.length,
            //               scrollDirection: Axis.horizontal,
            //               separatorBuilder: (_, __) => const SizedBox(width: TSizes.spaceBtwItems),
            //               itemBuilder: (_, index) => TProductCardHorizontal(imageUrl: images[index]),
            //             ),
            //           ),
            //           const SizedBox(height: TSizes.spaceBtwSections),
            //         ],
            //       );
            //     }).toList(),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
