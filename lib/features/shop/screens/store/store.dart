import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:testing_asg1/common/widgets/appbar/appbar.dart';
import 'package:testing_asg1/common/widgets/appbar/tabbar.dart';
import 'package:testing_asg1/common/widgets/brands/brand_card.dart';
import 'package:testing_asg1/common/widgets/brands/brand_show_case.dart';
import 'package:testing_asg1/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:testing_asg1/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:testing_asg1/common/widgets/images/t_circular_image.dart';
import 'package:testing_asg1/common/widgets/layouts/grid_layout.dart';
import 'package:testing_asg1/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:testing_asg1/common/widgets/texts/section_heading.dart';
import 'package:testing_asg1/common/widgets/texts/t_brand_title_text_verified_icon.dart';
import 'package:testing_asg1/features/shop/screens/brand/all_brands.dart';
import 'package:testing_asg1/features/shop/screens/store/dummy_brand.dart';
import 'package:testing_asg1/features/shop/screens/store/widgets/category_tab.dart';
import 'package:testing_asg1/utils/constants/colors.dart';
import 'package:testing_asg1/utils/constants/enums.dart';
import 'package:testing_asg1/utils/constants/image_strings.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';
import 'package:testing_asg1/utils/helpers/helper_functions.dart';


class StoreScreen extends StatelessWidget{
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context){
    //return DefaultTabController()
    // length: 5,
    final dark = THelperFunctions.isDarkMode(context);

    return DefaultTabController(
      length: 6,//number of tabs we created
      child: Scaffold(
        appBar: TAppBar(
          title:Text('Store',style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            TCartCounterIcon(onPressed:(){}, iconColor: dark? TColors.white : TColors.dark),
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
                      // const SizedBox(height:TSizes.spaceBtwItems),
                      const TSearchContainer(
                            text:"Search in Store", showBorder:true, showBackground:false, padding: EdgeInsets.zero),
                      const SizedBox(height: TSizes. spaceBtwSections),
      
      
                      //Featured Brands
                      TSectionHeading(title:'Featured Brands', showActionButton:true,onPressed: () => Get.to(() => const AllBrandsScreen())),
                      //TSectionHeading(title:'Featured Brands', showActionButton:true,onPressed: (){}),
                      const SizedBox(height: TSizes.spaceBtwItems/1.5),
      
                      TGridLayout(
                        itemCount:4,
                        //itemCount: dummyBrands.length,
                        mainAxisExtent: 80, 
                        itemBuilder:(_,index){
                        final brand = dummyBrands[index];
                        // In the Backend Tutorial we will pass the each Brand and onPress Event also
                        // return const TBrandCard(showBorder:false); 
                        return TBrandCard(
                          showBorder:false,
                          title: brand.title,
                          imagePath: brand.image,
                          productCount: brand.productCount,
                          );

                      }
                      )
                    ],
                  ),
                ),
      
      
                //Tabs --video 18
                bottom:const TTabBar(
                  tabs: [
                     Tab(child: Text('Health')),
                     Tab(child: Text('Skin Care')),
                     Tab(child: Text('Personal Care')),
                     Tab(child: Text('Hair Care')),
                     Tab(child: Text('Baby Care')),
                     Tab(child: Text('Household')),
                  ],
                )
              ),
            ];
          }, 
          // Body
            //  body:const TabBarView(
            //   children: [TCategoryTab(),TCategoryTab(),TCategoryTab(),TCategoryTab(),TCategoryTab(),TCategoryTab()],
            //  ),
        
            body: const TabBarView(
              children: [
                TCategoryTab(category: 'Health'),
                TCategoryTab(category: 'Skin Care'),
                TCategoryTab(category: 'Personal Care'),
                TCategoryTab(category: 'Hair Care'),
                TCategoryTab(category: 'Baby Care'),
                TCategoryTab(category: 'Household'),
              ],
            ),
          ),
      ),
    );
    
  }
}
