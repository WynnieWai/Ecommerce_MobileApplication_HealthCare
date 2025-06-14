import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:testing_asg1/common/styles/shadows.dart';
import 'package:testing_asg1/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:testing_asg1/common/widgets/icons/t_circular_icon.dart';
import 'package:testing_asg1/common/widgets/images/t_rounded_image.dart';
import 'package:testing_asg1/common/widgets/texts/product_price_text.dart';
import 'package:testing_asg1/common/widgets/texts/product_title_text.dart';
import 'package:testing_asg1/common/widgets/texts/t_brand_title_text_verified_icon.dart';
import 'package:testing_asg1/features/shop/models/product_model.dart';
import 'package:testing_asg1/features/shop/screens/home/dummy_product.dart';
import 'package:testing_asg1/features/shop/screens/product_details/product_detail.dart';
import 'package:testing_asg1/utils/constants/colors.dart';
import 'package:testing_asg1/utils/constants/image_strings.dart';
// ignore: library_prefixes
import 'package:testing_asg1/utils/constants/sizes.dart';
import 'package:testing_asg1/utils/helpers/helper_functions.dart';

class TProductCardVertical extends StatelessWidget{
  const TProductCardVertical ({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context){
    final dark = THelperFunctions.isDarkMode(context);

    /// Container with side paddings, color, edges, radius, and shadow
    return GestureDetector(
      onTap:() => Get.to(() => const ProductDetailScreen()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          children: [
            /// Thumbnail, Wishlist Button, Discount Tag
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  // --- Thumbnail Image
                  const TRoundedImage(imageUrl: TImages.productImage80, applyImageRadius: true,),
                  // TRoundedImage(imageUrl: product.imageUrl, applyImageRadius: true,),
      
                  // --- Sale Tag
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text('25%', style:Theme.of(context).textTheme.labelLarge!.apply(color:TColors.black))
                    ),
                  ),

                  // -- Favourite Icon Button 
                  Positioned(
                    top: 0,
                    right: 0,
                    // child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red),
                    child: TCircularIcon(
                      icon: Iconsax.heart5,
                      color: product.isFavorite ? Colors.red : null, // Red if true, default if false
                      // onPressed: () => _toggleFavorite(product),
                    ),
                  ),
                ],
              )
              
            ),
            const SizedBox(height:TSizes.spaceBtwItems/2),
      
            /// Details
            // Padding(
            //   padding:const EdgeInsets.only(left:TSizes.sm),
            //   child:Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       TProductTitleText(title: product.title,smallSize: true),
            //       const SizedBox(height:TSizes.spaceBtwItems/2),
            //       TBrandTitleWithVerifiedIcon(title:product.brand),
            //     ], 
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TProductTitleText(title: product.title, smallSize: true),
                        const SizedBox(height: TSizes.spaceBtwItems/2),
                        TBrandTitleWithVerifiedIcon(title: product.brand),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Use Spacer() to utilize all the space to set the price and the cart button at the bottom
            // This usually happens when Product title is in single line or 2 lines (Max) 

            const Spacer(),

            //Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price 
                Padding(
                  padding: const EdgeInsets.only(left: TSizes.md),
                  child: TProductPriceText(price: product.price),
                ),

                /// Add to Cart Button 
                Container(
                  decoration: const BoxDecoration(
                    color:TColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSizes.cardRadiusMd),
                      bottomRight: Radius.circular(TSizes.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                    width: TSizes.iconLg * 1.2,
                    height: TSizes.iconLg * 1.2,
                    child: Center(child:Icon(Iconsax.add, color: TColors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
