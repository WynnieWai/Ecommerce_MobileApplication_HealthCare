import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:testing_asg1/common/widgets/appbar/appbar.dart';
import 'package:testing_asg1/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:testing_asg1/common/widgets/icons/t_circular_icon.dart';
import 'package:testing_asg1/common/widgets/images/t_rounded_image.dart';
import 'package:testing_asg1/common/widgets/texts/section_heading.dart';
import 'package:testing_asg1/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:testing_asg1/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:testing_asg1/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:testing_asg1/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:testing_asg1/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:testing_asg1/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 - Product Image Slider
            TProductImageSlider(),

            /// 2 - Product Details
            Padding(
              padding: EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// - Rating & Share
                  TRatingAndShare(),

                  /// - Price, Title, Stock, & Brand
                  TProductMetaData(),

                  /// -- Attributes
                  TProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Checkout Button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: Text('Checkout'))),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// - Description
                  const TSectionHeading(title: 'Description', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ReadMoreText(
                    'This is a Product description for Blue Nike Sleeve less vest. There are more things that can be added but I am just practicing and nothing else.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800)
                  ),
                
                  /// - Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(title: 'Reviews(199)', showActionButton: false),
                      IconButton(icon: const Icon(Iconsax.arrow_right_3, size: 18), onPressed: () => Get.to(() => const ProductReviewsScreen())),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


