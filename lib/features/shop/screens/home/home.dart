import 'package:flutter/material.dart';
import 'package:testing_asg1/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:testing_asg1/features/shop/screens/home/widgets/home_appbar.dart';

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

            //Padding(
              //padding:EdgeInsets.all(TSizes.defaultSpace),
              //child:Column(
                //children:[
                  //TPromoSlider(banners:[TImage.promoBanner1,TImages.promoBanner2,TImages.promoBanner3]),
                  //TProductCardVertical();
               // ]
              //)
            //)
          ],
        ),
      ),
    );
  }
}







