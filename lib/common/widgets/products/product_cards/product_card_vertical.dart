import 'package:flutter/material.dart';
import 'package:testing_asg1/common/styles/shadows.dart';
import 'package:testing_asg1/utils/constants/colors.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';
import 'package:testing_asg1/utils/helpers/helper_functions.dart';

class TProductCardVertical extends StatelessWidget{
  const TProductCardVertical ({super.key});

  @override
  Widget build(BuildContext context){
    final dark=THelperFunctions.isDarkMode(context);

    return Container(
      width:180,
      padding:const EdgeInsets.all(1),
      decoration:BoxDecoration(
        boxShadow:[TShadowStyle.verticalProductShadow],
        borderRadius:BorderRadius.circular(TSizes.productImageRadius),
        color:dark?TColors.darkerGrey:TColors.white,
      ),

      child:Column(
        
      )
    );
  }
}