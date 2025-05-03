import 'package:flutter/material.dart';
import 'package:testing_asg1/common/widgets/products/cart/add_remove_button.dart';
import 'package:testing_asg1/common/widgets/products/cart/cart_item.dart';
import 'package:testing_asg1/common/widgets/texts/product_price_text.dart';
import 'package:testing_asg1/utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButton = true,
  });

  final bool showAddRemoveButton ;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_,__)=>const SizedBox(height:TSizes.spaceBtwSections), 
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children:[

          //Cart Item
          TCartItem(),
          if(showAddRemoveButton) const SizedBox(height: TSizes.spaceBtwItems),

          //Product Price and Add Remove Button
          if(showAddRemoveButton) 
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    //Extra space
                    SizedBox(width: 70),

                    //Add Remove Button
                    TProductQuantityWithAddRemoveButton(),
                  ],
                ),
              
              //Product Total Price
              TProductPriceText(price: '256'),
            ],
          ),
        ]
      )
    );
  }
}