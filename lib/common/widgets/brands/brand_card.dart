
// import 'package:flutter/material.dart';
// import 'package:testing_asg1/common/widgets/custom_shapes/containers/rounded_container.dart';
// import 'package:testing_asg1/common/widgets/images/t_circular_image.dart';
// import 'package:testing_asg1/common/widgets/texts/t_brand_title_text_verified_icon.dart';
// import 'package:testing_asg1/utils/constants/enums.dart';
// import 'package:testing_asg1/utils/constants/sizes.dart';

// class TBrandCard extends StatelessWidget {
//   const TBrandCard({
//     super.key,
//     this.onTap,
//     required this.showBorder,
//     required this.title,
//     required this.imagePath,
//     required this.productCount,
//   });

//   final bool showBorder;
//   final void Function()? onTap;
//   final String title;
//   final String imagePath;
//   final int productCount;


//   @override
//   Widget build(BuildContext context) {
//     // final isDark = THelperFunctions.isDarkMode(context);
//     return GestureDetector(
//       onTap: onTap,
//       child: TRoundedContainer(
//         padding:const EdgeInsets.all(TSizes.sm),
//         showBorder:true,
//         backgroundColor: Colors.transparent,
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
      
//      // Icon
//             Flexible(
//               child: TCircularImage(
//                 isNetworkImage: false,
//                 image:imagePath,
//                 backgroundColor: Colors.transparent,
//                 //overlayColor: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,
//               ),
//             ),
//             const SizedBox(width: TSizes.spaceBtwItems/2),
          
//             // Text
//             Expanded(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   TBrandTitleWithVerifiedIcon(title:title,brandTextSize: TextSizes.large),
//                   Text(
//                     '$productCount products',
//                     overflow: TextOverflow.ellipsis,
//                     style: Theme.of(context).textTheme.labelMedium,
//                   )
                              
//           ],
//         ),
//       )
//     ], //children
//     ),//Row
//     ),
//                           );
//   }
// }


import 'package:flutter/material.dart';
import 'package:testing_asg1/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:testing_asg1/common/widgets/images/t_circular_image.dart';
import 'package:testing_asg1/common/widgets/texts/t_brand_title_text_verified_icon.dart';
import 'package:testing_asg1/features/shop/models/brand_model.dart';
import 'package:testing_asg1/utils/constants/colors.dart';
import 'package:testing_asg1/utils/constants/enums.dart';
import 'package:testing_asg1/utils/constants/image_strings.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';
import 'package:testing_asg1/utils/helpers/helper_functions.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    this.onTap,
    required this.showBorder,required this.brand,
  });

  final BrandModel brand;
  final bool showBorder;
  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        padding:const EdgeInsets.all(TSizes.sm),
        showBorder:true,
        backgroundColor: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
      
            // Icon
            Flexible(
              child: TCircularImage(
                isNetworkImage: true,
                image:brand.image,
                //backgroundColor: Colors.transparent,
                //overlayColor: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems/2),
          
            // Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TBrandTitleWithVerifiedIcon(title:brand.name,brandTextSize: TextSizes.large),
                  Text(
                    '${brand.productsCount ?? 0} products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                              
          ],
        ),
      )
    ], //children
    ),//Row
    ),
                          );
  }
}

