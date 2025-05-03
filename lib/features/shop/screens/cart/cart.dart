import 'package:flutter/material.dart';
import 'package:testing_asg1/common/widgets/appbar/appbar.dart';
import 'package:testing_asg1/common/widgets/images/t_rounded_image.dart';
import 'package:testing_asg1/utils/constants/colors.dart';
import 'package:testing_asg1/utils/constants/image_strings.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';
import 'package:testing_asg1/utils/helpers/helper_functions.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (_,__)=>const SizedBox(height:TSizes.spaceBtwSections), 
            itemCount: 4,
            itemBuilder: (_, index) => Column(
              children:[
                Row(
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
                    //Title and Price
                    Column(
                      children: [
                        // TBrandTitleWithVerifiedIcon(
                        //   title: 'Product Title',
                        //   verified: true,
                        //   textStyle: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.dark, fontSizeDelta: 2),
                        // ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                const Divider(),
              ]
            )
        ),
      ),
    );
  }
}