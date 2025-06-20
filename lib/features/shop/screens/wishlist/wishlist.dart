import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:testing_asg1/common/widgets/appbar/appbar.dart';
import 'package:testing_asg1/common/widgets/icons/t_circular_icon.dart';
import 'package:testing_asg1/common/widgets/layouts/grid_layout.dart';
import 'package:testing_asg1/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:testing_asg1/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:testing_asg1/features/shop/controllers/product/favourites_controller.dart';
import 'package:testing_asg1/features/shop/models/product_model.dart';
import 'package:testing_asg1/features/shop/screens/home/home.dart';
import 'package:testing_asg1/navigation_menu.dart';
import 'package:testing_asg1/utils/constants/image_strings.dart';
import 'package:testing_asg1/utils/helpers/cloud_helper_functions.dart';
import 'package:testing_asg1/utils/loaders/animation_loader.dart';

import '../../../../utils/constants/sizes.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;

    return Scaffold(
      /// Custom AppBar
      appBar: TAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        // actions: [
        //   TCircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen())),
        // ],
      ),

      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),

          /// Products Grid 
          child: Obx(
            ()=> FutureBuilder(
              future: controller.favoriteProducts(),
              builder: (context, snapshot) {
                // Nothing Found Widget
                final emptyWidget = TAnimationLoaderWidget(
                  text: 'Whoops! Wishlist is Empty', 
                  animation: TImages.pencilAnimation,
                  showAction: true,
                  actionText: 'Let\'s add some',
                  onActionPressed: ()=> Get.off(()=>const NavigationMenu()),
                );
            
                const loader = TVerticalProductShimmer(itemCount: 6);
                final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader, nothingFound: emptyWidget);
                if(widget!=null) return widget;
            
                final products = snapshot.data!;
            
                return TGridLayout(
                  itemCount: products.length, 
                  itemBuilder: (_, index) => TProductCardVertical(product: products[index])
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}