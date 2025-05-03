import 'package:flutter/material.dart';
import 'package:testing_asg1/common/widgets/appbar/appbar.dart';
import 'package:testing_asg1/common/widgets/brands/brand_card.dart';
import 'package:testing_asg1/features/shop/screens/all_products/all_products.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      appBar: TAppBar(title:Text('Nike')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child:Column(
            children: [
              TBrandCard(showBorder:true),
              SizedBox(height: TSizes.spaceBtwSections),

              TSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}