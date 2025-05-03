import 'package:flutter/material.dart';
import 'package:testing_asg1/common/widgets/images/t_rounded_image.dart';
import 'package:testing_asg1/common/widgets/texts/product_title_text.dart';
import 'package:testing_asg1/common/widgets/texts/t_brand_title_text_verified_icon.dart';
import 'package:testing_asg1/utils/constants/colors.dart';
import 'package:testing_asg1/utils/constants/image_strings.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';
import 'package:testing_asg1/utils/helpers/helper_functions.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Product Image
        TRoundedImage(
          imageUrl: TImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context)? TColors.darkerGrey : TColors.light
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        //Title and Price & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleWithVerifiedIcon( title: "Nike"),
              const Flexible(child: TProductTitleText(title:'Black Sports shoes', maxLines: 1)),
          
              Text.rich(
                TextSpan(children: 
                  [
                    TextSpan(text: 'Color: ', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: 'Green', style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(text: 'Size: ', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: 'UK 08', style: Theme.of(context).textTheme.bodyLarge)
                  ]
                )
              )
            ],
          ),
        )
      ],
    );
  }
}