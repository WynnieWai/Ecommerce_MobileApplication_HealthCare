import 'package:flutter/material.dart';
import 'package:testing_asg1/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:testing_asg1/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:testing_asg1/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:testing_asg1/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:testing_asg1/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:testing_asg1/common/widgets/images/t_rounded_image.dart';
import 'package:testing_asg1/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:testing_asg1/utils/constants/colors.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header --
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// -- Appbar --
                  THomeAppBar(),
                  //SizedBox(height:TSizes.spaceBtwSections),

                  /// -- Searchbar --
                  //TSearchContainer(text:'Search in Store'),
                  //SizedBox(height:TSizes.spaceBtwSections),

                  /// -- Categories --
                  //Padding()
                ],
              )
            ),

            /// Body -- Tutorial [Section # 3, Video # 5]
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: TPromoSlider(banners: [TImages.promoBanner1, TImages.promoBanner2, TImages.promoBanner3],),
            )
          ],
        ),
      ),
    );
  }
}





