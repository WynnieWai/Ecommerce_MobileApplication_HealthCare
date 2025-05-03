import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:testing_asg1/common/widgets/appbar/appbar.dart';
import 'package:testing_asg1/common/widgets/products/cart/add_remove_button.dart';
import 'package:testing_asg1/common/widgets/products/cart/cart_item.dart';
import 'package:testing_asg1/common/widgets/texts/product_price_text.dart';
import 'package:testing_asg1/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:testing_asg1/features/shop/screens/checkout/checkout.dart';

import 'package:testing_asg1/utils/constants/sizes.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(showBackArrow:true, title:Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

        //items in cart
        child: TCartItems(),
      ),


      //Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: ()=>Get.to(()=> const CheckoutScreen()), child: Text('Checkout \$256.0')),
      ),
    );
  }
}
