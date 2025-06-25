import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_asg1/common/widgets/products/cart/add_remove_button.dart';
import 'package:testing_asg1/common/widgets/products/cart/cart_item.dart';
import 'package:testing_asg1/common/widgets/texts/product_price_text.dart';
import 'package:testing_asg1/features/shop/controllers/product/cart_controller.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButton = true,
  });

  final bool showAddRemoveButton ;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (_,__)=>const SizedBox(height:TSizes.spaceBtwSections), 
        itemCount: cartController.cartItems.length,
        itemBuilder: (_, index) => Obx(
          () {
            final item = cartController.cartItems[index];
            return Column(
            children:[
                
              //Cart Item
              TCartItem(cartItem: item),
              if(showAddRemoveButton) const SizedBox(height: TSizes.spaceBtwItems),
                
              //Product Price and Add Remove Button
              if(showAddRemoveButton) 
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        //Extra space
                        SizedBox(width: 70),
                
                        //Add Remove Button
                        TProductQuantityWithAddRemoveButton(
                          quantity: item.quantity,
                          add: () => cartController.addOneToCart(item),
                          remove: () => cartController.removeOneFromCart(item),
                        ),
                      ],
                    ),
                  
                  //Product Total Price
                  TProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1)),
                  // Delete Button
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => cartController.removeFromCart(item),
                    tooltip: 'Delete Item',
                  ),
                ],
              ),
            ]
          ); },
        )
      ),
    );
  }
}