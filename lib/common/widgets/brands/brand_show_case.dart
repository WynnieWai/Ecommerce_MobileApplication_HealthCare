
import 'package:flutter/material.dart';
import 'package:testing_asg1/common/widgets/brands/brand_card.dart';
import 'package:testing_asg1/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:testing_asg1/utils/constants/colors.dart';
import 'package:testing_asg1/utils/constants/image_strings.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';
import 'package:testing_asg1/utils/helpers/helper_functions.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key, 
    required this.images,

  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkerGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(TSizes.sm),
      margin:const EdgeInsets.only(bottom:TSizes.spaceBtwItems),
      child:Column(
        children: [
          // Brand with Product Count
          //const TBrandCard(showBorder:false),
          const SizedBox(height: TSizes.spaceBtwItems),
    
          //Brand top 3 products images
          Row( children:images.map((image) =>brandTopProductImageWidget(image, context)).toList())
        ],
      )
    );
  }

  Widget brandTopProductImageWidget(String image,context){
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        padding:const EdgeInsets.all(TSizes.md),
        margin:const EdgeInsets.only(right:TSizes.sm),
        backgroundColor: THelperFunctions.isDarkMode(context)?TColors.darkGrey:TColors.light,
        child: Image(fit: BoxFit.contain, image: AssetImage(image)),
      ),
    );
  }
}



