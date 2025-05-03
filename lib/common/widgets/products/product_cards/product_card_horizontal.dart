import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:testing_asg1/common/styles/shadows.dart';
import 'package:testing_asg1/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:testing_asg1/common/widgets/icons/t_circular_icon.dart';
import 'package:testing_asg1/common/widgets/images/t_rounded_image.dart';
import 'package:testing_asg1/common/widgets/texts/product_title_text.dart';
import 'package:testing_asg1/utils/constants/colors.dart';
import 'package:testing_asg1/utils/constants/image_strings.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';
import 'package:testing_asg1/utils/helpers/helper_functions.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Container(
      width: 310, 
      padding: const EdgeInsets.all(1), 
      decoration: BoxDecoration(
        boxShadow: [TShadowStyle.verticalProductShadow], 
        borderRadius: BorderRadius.circular(TSizes.productImageRadius), 
        color: dark ? TColors.darkerGrey : TColors.white,
      ),
      child: Row(
        children: [
          /// Thumbnail
          TRoundedContainer(
            height: 120, 
            padding: const EdgeInsets.all(TSizes.sm), 
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                /// -- Thumbnail Image 
                const SizedBox(
                  height: 120, 
                  width: 120,
                  child: TRoundedImage(imageUrl: TImages.productImage1, applyImageRadius: true),
                ),

                /// --- Sale Tag
                Positioned(
                  top: 12,
                  child: TRoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text(
                      '25%', 
                      style: Theme.of(context).textTheme.labelLarge!.apply(color:TColors.black)
                    ),
                  ),
                ),
  
                  /// -- Favourite Icon Button 
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red),
                  ),
              ],
            ),
          ),

          /// Details 
          const Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: TSizes.sm),
                child: Column(
                  children: [
                    TProductTitleText(title: 'Green Nike Half Sleeves Shirt', smallSize: true),
                    SizedBox(height: TSizes.spaceBtwItems / 2),
                    TBrandTitleWithVerifiedIcon(title: 'Nike'),
                  ],
                )
              ),
            ],
          ),
        ],
      ),
    );
  }
}