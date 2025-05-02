import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:testing_asg1/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:testing_asg1/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:testing_asg1/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:testing_asg1/common/widgets/texts/section_heading.dart';
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
                ],
              )
            ),

            /// Body -- Tutorial [Section # 3, video #5]
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children:[
                  TPromoSlider(banners: [TImages.promoBanner1, TImages.promoBanner2, TImages.promoBanner3]),
                  // TProductCardVertical();
               ]
              )
            )
          ],
        ),
      ),
    );
  }
}







