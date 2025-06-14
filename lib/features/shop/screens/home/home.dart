import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_asg1/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:testing_asg1/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:testing_asg1/common/widgets/layouts/grid_layout.dart';
import 'package:testing_asg1/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:testing_asg1/common/widgets/texts/section_heading.dart';
import 'package:testing_asg1/features/shop/screens/all_products/all_products.dart';
import 'package:testing_asg1/features/shop/screens/home/dummy_product.dart';
import 'package:testing_asg1/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:testing_asg1/features/shop/screens/home/widgets/home_categories.dart';
import 'package:testing_asg1/features/shop/screens/home/widgets/promo_slider.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header --
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// -- Appbar --
                  const THomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Searchbar --
                  const TSearchContainer(text: 'Search in Store'),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  
                  /// -- Categories --
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace), 
                    child: Column(
                      children: [
                        /// Heading 
                        TSectionHeading(title: 'Popular Categories', showActionButton: false, textColor: Colors.white),
                        const SizedBox(height: TSizes.spaceBtwItems),

                        /// Categories 
                        THomeCategories(),
                      ],
                    ),
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              )
            ),

            /// Body -- Tutorial [Section # 3, video #5]
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children:[
                  //Promo Slider
                  // const TPromoSlider(banners: [TImages.myBanner1, TImages.myBanner2, TImages.myBanner3]),
                  const TPromoSlider(),
                  const SizedBox(height:TSizes.spaceBtwSections),

                  //Heading
                  TSectionHeading(title: 'Popular Products',onPressed:()=>Get.to(()=>const AllProducts())),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  //Popular Product
                  // TGridLayout(itemCount: 4, itemBuilder: (_,index)=>const TProductCardVertical())
                  TGridLayout(
                    itemCount: products.length,
                    itemBuilder: (_, index) => TProductCardVertical(
                      product: products[index],
                    ),
                  ),
               ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}







