import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:testing_asg1/common/widgets/appbar/appbar.dart';
import 'package:testing_asg1/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:testing_asg1/utils/constants/colors.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';
import 'package:testing_asg1/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget{
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context){
    //return DefaultTabController()
    // length: 5,
    return Scaffold(
      appBar: TAppBar(
        title:Text('Store',style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCartCounterIcon(onPressed:(){}, iconColor: TColors.black),
        ],

      ),
      body: NestedScrollView(
        headerSliverBuilder: ( _ ,innerBoxIsScrolled){
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned:true,
              floating: true,
              backgroundColor:THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
              expandedHeight: 440,
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child:ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    //Search Bar
                    //const SizedBox(height:TSizes.spaceBtwItems),
                    //const TSearchContainer(
                    // text:"Search in Store", showBorder:true,showBackground:false, padding: EdgeInsets.zero),
                    //const SizedBox(height: TSizes. spaceBtwSections),


                    //Featured Brands
                    //TSectionHeading(title:'Featured Brands', showActionButton:true,onPressed: (){}),
                    //const SizedBox(height: TSizes.spaceBtwItems/1.5),

                    //TRoundedContainer(
                    // padding:const EdgeInsets.all(TSizes.sm),
                    // showBorder:true,
                    // backgroundColor: Colors.transparent,
                    // child: Row(
                    // children: [
                      //Icon
                      //Container(
                      //  width:56,
                      //  height:56,
                      //  padding: const EdgeInsets.all(TSizes.sm),
                      //  decoration: BoxDecoration(
                      //     color: THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
                      //     borderRadius: BorderRadius.circular(100),
                      
                      //),// BoxDecoration
                      
                      // child: Image(
                      // image: AssetImage(TImages.clothIcon),
                      // color: ThelperFunctions.isDarkMode(context) ? TColors.white : TColors.dark,
                      //), //image

                      //)//Container
                      ///
                      ///
                    //], //children
                    //),//Row
                    //)//RoundedContainer
                    
                  ],
                ),
              ),


              //Tabs --video 18
              // bottom: TabBar(
              //   isScrollable: true,
              //   indicatorColor: TColors.primary,
              //   unselectedLabelColor: TColors.darkGrey,
              //   labelColor: ThelperFunctions.isDarkMode(context) ? TColors.white : TColors.primary,
              //   tabs:[
              //      Tab(child: Text('Sports')),
              //      Tab(child: Text('Clothing')),
              //      Tab(child: Text('Electronics')),
              //      Tab(child: Text('Home')),
              //      Tab(child: Text('Beauty')),
              // ], //tabs
              //),//TabBar


            ),
          ];
        }, body:Container())
    );
    
  }
}
