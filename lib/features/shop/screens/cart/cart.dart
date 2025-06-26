import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_asg1/common/widgets/appbar/appbar.dart';
import 'package:testing_asg1/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:testing_asg1/features/shop/screens/checkout/checkout.dart';
import 'package:testing_asg1/navigation_menu.dart';

import 'package:testing_asg1/utils/constants/sizes.dart';
import 'package:testing_asg1/utils/loaders/animation_loader.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../controllers/product/cart_controller.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Scaffold(
      appBar: TAppBar(
        showBackArrow:true, 
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall)
      ),

      body: Obx(() {
          // Empty Cart Animation
          final emptyWidget = TAnimationLoaderWidget(
            text: 'Whoops! Cart is EMPTY.', 
            animation: TImages.cartAnimation,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          // if (controller.cartItems.isEmpty) {
          //   return emptyWidget;
          // } else {
          //   return const SingleChildScrollView(
          //     child: Padding(
          //       padding: EdgeInsets.all(TSizes.defaultSpace),
              
          //       //items in cart
          //       child: TCartItems(),
          //     ),
          //   );
          // }

          if (controller.cartItems.isEmpty) {
            return emptyWidget;
          } else {
            return Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    TCartItems(), // Uses shrinkWrap & disabled scroll
                  ],
                ),
              ),
            );
          }
        },
      ),

      // Bottom Checkout Button
      bottomNavigationBar: Obx(() => controller.cartItems.isEmpty
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: ElevatedButton(
                onPressed: () => Get.to(() => const CheckoutScreen()),
                child: Text('Checkout \$${controller.totalCartPrice.value.toStringAsFixed(2)}'),
              ),
            )),

      // bottomNavigationBar: controller.cartItems.isEmpty 
      //     ? const SizedBox()
      //     : Padding(
      //       padding: const EdgeInsets.all(TSizes.defaultSpace),
      //       child: ElevatedButton(
      //         onPressed: ()=>Get.to(()=> const CheckoutScreen()), 
      //         child: Obx(() => Text('Checkout \$${controller.totalCartPrice.value}')),
      //       ),
      //     ),
    );
  }
}
